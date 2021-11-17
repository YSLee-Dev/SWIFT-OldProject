//
//  ViewController.swift
//  AppDelegate_ex
//
//  Created by 이윤수 on 2020/10/26.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet var resultEmail: UITextField!
    @IBOutlet var resultUpdate: UISwitch!
    @IBOutlet var resultInterval: UIStepper!
   
    
    
    @IBAction func onClick(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(identifier: "secondView") as? secondViewController else{
            return
        }
        
        /*
        
        // AppDelegate 이용
        // AppDelegate의 객체의 인스턴스를 가져온다.
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        // rvc.paramEmail = resultEmail.text
        // rvc.paramUpdate = resultUpdate.isOn
        // rvc.paramInterval = resultInterval.value
        
        ad?.paramEmail = resultEmail.text
        ad?.paramUpdate = resultUpdate.isOn
        ad?.paramInterval = resultInterval.value
        
        */
        
        // UserDefault 객체의 인스턴스를 가져온다.
        let ud = UserDefaults.standard
        
        // 값을 저장한다.
        ud.set(self.resultEmail.text, forKey: "email")
        ud.set(self.resultUpdate.isOn, forKey: "isUpdate")
        ud.set(self.resultInterval.value, forKey: "interver")
        
        self.present(rvc, animated: true)
    }
}

