//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 이윤수 on 2020/10/22.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController{
    
    
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    // 2. 값을 받을 변수 선언
    var paramEmail:String = ""
    var paramUpdate:Bool = false
    var paramInterval:Double = 0
    
    // 5. 전달받은 값 표시
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdate == true ? "자동갱신" : "자동갱신안함")
        self.resultInterval.text = "\(Int(paramInterval))분마다 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
