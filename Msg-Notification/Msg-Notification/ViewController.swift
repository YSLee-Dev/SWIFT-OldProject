//
//  ViewController.swift
//  Msg-Notification
//
//  Created by 이윤수 on 2020/10/27.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var msg: UITextField!
    @IBOutlet var datepicker: UIDatePicker!
    
    @IBAction func save(_ sender: Any) {
        
        if #available(iOS 10, *){
            // ios 10 이상, UserNotification
            UNUserNotificationCenter.current().getNotificationSettings{settings in
                if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                    // 알림 설정이 들어갈 곳
                    let nContent = UNMutableNotificationContent()
                    nContent.body = (self.msg.text)!
                    nContent.title = "미리알림"
                    nContent.sound = UNNotificationSound.default
                    
                    // 발송 시각을 '지금으로 부터 *초 형식'으로 변환
                    let time = self.datepicker.date.timeIntervalSinceNow
                    // 발송 조건 정의
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
                    // 발송 요청 객체 정의
                    let request = UNNotificationRequest(identifier: "alarm", content: nContent, trigger: trigger)
                    // 노티피케이션 센터에 추가
                    UNUserNotificationCenter.current().add(request){(_)in
                        DispatchQueue.main.async {
                            // 발송 완료 안내 메세지 창
                            let date = self.datepicker.date.addingTimeInterval(9*60*90)
                            let message = "알림이 등록되었습니다. 드옥된 알람은 \(date)에 발송됩니다."
                            let alert = UIAlertController(title: "알림등록", message: message, preferredStyle: .alert)
                            let ok = UIAlertAction(title: "확인", style: .default)
                            
                            alert.addAction(ok)
                            
                            self.present(alert,animated: true)
                        }
                    }
                    
                }else{
                    // 알림 설정이 안되어 있을 경우 alert 창
                    let alert = UIAlertController(title:"알림등록", message: "알림이 허용되어 있지 않습니다.",preferredStyle: .alert)
                    let ok = UIAlertAction(title: "확인", style: .default)
                    alert.addAction(ok)
                    
                    self.present(alert,animated: true)
                    return
                }
            }
        }
        // ios 10 미만, LocalNotification - 앱 실행 X 되게 할 예정
    }
    
}

