//
//  TViewController.swift
//  MyProject-6
//
//  Created by 이윤수 on 2020/12/22.
//

import UIKit

class TViewController: UIViewController {

    var testBtn:UIButton!
    var ud = UserDefaults.standard
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        print("aaa")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if ud.string(forKey: "certified") == "1"{
            self.testBtn = UIButton(type: .system)
            self.testBtn.frame = CGRect(x: 0, y: 100, width: 10, height: 20)
            self.testBtn.setTitle("로그아웃", for: .normal)
            self.testBtn.sizeToFit()
            self.testBtn.center.x = self.view.frame.width/2
            self.testBtn.addTarget(self, action: #selector(logout(_:)) , for: .touchUpInside)
            self.view.addSubview(testBtn)
        }else{
            print("a")
        }
    }
    
    @objc func logout(_ sender:Any){
        self.ud.setValue(nil, forKey: "certified")
        self.ud.setValue(nil, forKey: "name")
        
        self.tabBarController?.selectedIndex = 0
        
    }
}

