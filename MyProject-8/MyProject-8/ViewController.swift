//
//  ViewController.swift
//  MyProject-8
//
//  Created by 이윤수 on 2021/03/10.
//

import UIKit

class ViewController: UIViewController {
    var ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var btn = UIButton(type: .system)
        btn.setTitle("로그아웃", for: .normal)
        btn.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        btn.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
  
    }

    @objc func click(_ sender:Any){
        ud.setValue("no", forKey: "loginIs")
        print("로그아웃")
        
        let svc = SViewController()
        svc.modalPresentationStyle = .fullScreen
        self.present(svc, animated: true)
    }
    
    
    func check(){
        if(ud.string(forKey: "loginIs")=="ok"){
            print("ok")
        }else{
            print("ok not")
            let svc = SViewController()
            svc.modalPresentationStyle = .fullScreen
            self.present(svc, animated: true)
        }
    }
}

