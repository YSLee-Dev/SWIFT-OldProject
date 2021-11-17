//
//  ViewController.swift
//  MyProject-4
//
//  Created by 이윤수 on 2020/11/11.
//

import UIKit
import UserNotifications

class ViewController: UIViewController{
    
    @IBOutlet var name: UILabel!
    @IBOutlet var weather: UILabel!
    @IBOutlet var temp: UILabel!
    @IBOutlet var hd: UILabel!
    @IBOutlet var reload_btn: UIButton!
    @IBOutlet var weather_img: UIImageView!
    @IBOutlet weak var alert_btn: UIButton!
    
    let ud = UserDefaults.standard
    var time:Double!

   
    override func viewDidLoad() {
        
        if (ud.string(forKey: "wc") == nil){
            self.reload_btn.isEnabled = false
            self.alert_btn.isEnabled = false
        }else{
            weather_load(value: ud.string(forKey: "wc")!)
        }
    }
    
    func weather_load(value:String){
        let url = "http://api.openweathermap.org/data/2.5/weather?q=\(value)&appid=fcb7bb746f967f5a8ffc6325dd2be25c"
        
        let url_s:URL! = URL(string: url)
        
        do{
            let data =  try Data(contentsOf: try url_s)
            
            // 도시이름
            let data_s = try! JSONSerialization.jsonObject(with: data, options: [])as! NSDictionary
            self.name.text = data_s["name"]as? String
            
            // 날씨
            let data_w = data_s["weather"] as! NSArray
            let data_rw = data_w[0]as! NSDictionary
            self.weather.text = data_rw["main"]as! String
            
            // 현재기온
            let data_m = data_s["main"]as! NSDictionary
            let temp_s = data_m["temp"]as! Double
            self.temp.text = "\(String(Int(temp_s-273)))도"
            
            // 현재습도
            let hd_s = data_m["humidity"]as! Double
            self.hd.text = "\(String(Int(hd_s)))%"
            
            
            // 날씨 이미지
            let imgv = data_rw["icon"]as! String
            let img_url = "http://openweathermap.org/img/w/\(imgv).png"
            let imgs_url:URL! = URL(string: img_url)
            let w_img = try! Data(contentsOf: imgs_url)
            self.weather_img.image = UIImage(data: w_img)
            
            
        }catch{
            self.name.text = "도시이름을 다시 입력하세요."
        }
        
    }
    
    @IBAction func click(_ sender: Any) {
        let alert = UIAlertController(title: "도시추가", message: "날씨를 받을 도시를 영문으로 입력하세요.", preferredStyle: .alert)
        alert.addTextField(){(tf)in
            tf.placeholder = "도시영문명 ex(seoul)"
        }
        let ok = UIAlertAction(title: "저장", style: .default){(_)in
            
            if let sn =  alert.textFields?[0].text{
                self.ud.setValue(sn, forKey: "wc")
                self.reload_btn.isEnabled = true
                self.alert_btn.isEnabled = true
                self.weather_load(value: sn)
                
            }
            
        }
        
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    @IBAction func reload(_ sender: Any) {
        self.weather_load(value: self.ud.string(forKey: "wc")!)
        NSLog("새로고침 완료")
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "알림을 받으시겠습니까?", message: "몇 초 뒤에 알람을 받을 지 적어주세요.", preferredStyle: .alert)
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "네", style: .destructive){(_)in
            UNUserNotificationCenter.current().delegate = self
            UNUserNotificationCenter.current().getNotificationSettings{(settings) in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    let nContents = UNMutableNotificationContent()
                    nContents.badge = 1
                    nContents.title = "아침입니다!! 날씨 확인하러 오세요~"
                    nContents.body = "날씨를 보시려면 메세지를 클릭해주세요."
                    nContents.sound = UNNotificationSound.default
                    
                    
                    DispatchQueue.main.sync {
                        guard let tf_time = alert.textFields?[0].text else{
                            return
                        }
                        self.time  = Double(tf_time)
                    }
                    
                   
                    
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: self.time, repeats: false)
                    // 아침에 알림받는 부분 수정하기
                    let request = UNNotificationRequest(identifier: "weather", content: nContents, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                }else{
                    
                }
            }
        })
        alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        self.present(alert, animated: true)
    }
   
}
extension ViewController:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.weather_load(value: self.ud.string(forKey: "wc")!)
        print("alert으로 새로고침 완료")
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        self.weather_load(value: self.ud.string(forKey: "wc")!)
        print("이미 앱내에 접속함")
    }
}
