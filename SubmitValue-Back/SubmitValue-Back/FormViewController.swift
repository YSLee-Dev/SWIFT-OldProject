//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 이윤수 on 2020/10/26.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class FormViewController : UIViewController{
 
    
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("2번째 화면 실행됨ㄴ");
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음,
        // ViewController 타입으로 캐스팅한다.
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else{
            return
        }
        
        // 값을 전달한다.
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramIntetval = self.interval.value
        
        NSLog("\(vc.paramEmail)")
        NSLog("\(vc.paramUpdate)")
        NSLog("\(vc.paramIntetval)")

        
        // 이전 화면으로 복귀한다.
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
