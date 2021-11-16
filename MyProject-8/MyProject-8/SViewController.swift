//
//  SViewController.swift
//  MyProject-8
//
//  Created by 이윤수 on 2021/03/10.
//

import UIKit

class SViewController: UIViewController {

    var ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        
        var btn = UIButton(type: .system)
        btn.setTitle("로그인", for: .normal)
        btn.frame = CGRect(x: 0, y: 50, width: 100, height: 100)
        btn.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func click(_ sender:Any){
        ud.setValue("ok", forKey: "loginIs")
        print("로그인")
        
        self.dismiss(animated: true)
    }
    

}
