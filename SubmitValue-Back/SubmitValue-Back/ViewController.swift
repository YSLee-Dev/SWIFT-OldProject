//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 이윤수 on 2020/10/26.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 값을 화면에 표시하기 위한 아울렛 변수들
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    // 값을 직접 전달받을 프로퍼티들
    var paramEmail:String?
    var paramUpdate:Bool?
    var paramIntetval:Double?
    
    // 화면 표시될 때마다 실행되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        
        if let email = paramEmail{
            resultEmail.text = email
            NSLog("aa")
        }else{
            NSLog("값이 없음")
        }
        
        if let update = paramUpdate{
            resultUpdate.text = update == true ? "자동갱신" : "자동갱신안함"
        }
        
        if let interval = paramIntetval{
            resultInterval.text = "\(Int(interval))분마다"
        }
    }
    
    @IBAction func onRegist(_ sender: Any) {
        let uvc = self.storyboard!.instantiateViewController(identifier:"FormViewController")
        
        self.present(uvc, animated: true)
    }
    
}

