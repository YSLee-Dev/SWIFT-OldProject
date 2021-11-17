//
//  secondView.swift
//  MyProject-1
//
//  Created by 이윤수 on 2020/10/27.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit
import UserNotifications

class secondViewController:UIViewController, UNUserNotificationCenterDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var resultTime:String?
    var resultContents:String?
    var resultPeople:String?
    var resulttime2:Date?
    var imgCode_s:UIImage?
    
    
    @IBOutlet var displayTime: UILabel!
    @IBOutlet var displayContents: UILabel!
    @IBOutlet var displayPeople: UILabel!
    @IBOutlet var s_title: UILabel!
    @IBOutlet var impo: UILabel!
    
    override func viewDidLoad() {
        
        self.displayTime.text = resultTime
        self.displayContents.text = resultContents
        self.displayPeople.text = resultPeople
    
        let noti = UNUserNotificationCenter.current()
        
        noti.delegate = self
        
        noti.getNotificationSettings(){(settings)in
            if settings.authorizationStatus == UNAuthorizationStatus.authorized{
                
                // 알림 컨텐츠 객체
                let nContents = UNMutableNotificationContent()
                nContents.title = "予約時間"
                nContents.badge = 1
                nContents.body = "お店の前に５分前土着してください。"
                nContents.sound = UNNotificationSound.default
                nContents.userInfo = ["code":self.resultPeople]
                
                // 알림 발송 조건 객체
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: self.resulttime2!.timeIntervalSinceNow, repeats: false)
                
                // 알림 요청 객체
                let request = UNNotificationRequest(identifier: "re", content: nContents, trigger: trigger)
                
                // 노티피케이션 센터에 추가
                UNUserNotificationCenter.current().add(request)
                
            }else{
                self.s_title.text = "通知にアクセスができません"
            }
        }
    }
    
    @IBAction func onCheck(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = false
        
        picker.delegate = self
        
        self.present(picker, animated: true)
        
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier=="re"{
            self.s_title.text = "今が予約時間です。"
            self.impo.text = "通知をクリックして下さい。"
            
        }
        completionHandler([.alert,.badge,.sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        guard let pvc = self.storyboard?.instantiateViewController(withIdentifier: "ViewCodeController") as? ViewCodeController else{
            return
        }
        
        pvc.resultCode = self.resultPeople
        pvc.imgCode = self.imgCode_s
        
        self.present(pvc, animated: true)
        completionHandler()
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true){()in
            let alert = UIAlertController(title:"", message: "写真登録がキャンセルしました", preferredStyle: .alert)
            let check = UIAlertAction(title: "確認", style: .destructive)
            alert.addAction(check)
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true){()in
            let alert = UIAlertController(title:"", message: "写真登録が完了しました", preferredStyle: .alert)
            let check = UIAlertAction(title: "確認", style: .destructive)
            alert.addAction(check)
            self.present(alert, animated: true)
            
            self.imgCode_s = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        }
    }
}




