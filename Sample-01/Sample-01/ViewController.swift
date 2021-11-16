//
//  ViewController.swift
//  Sample-01
//
//  Created by 이윤수 on 2021/06/22.
//

import UIKit

class ViewController: UIViewController {

    var okBtn = UIButton(type: .custom)
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "aa"
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "SNUH.jpg"), for: .default)
        
        
        self.okBtn.setTitle("확인", for: .normal)
        self.okBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.okBtn.setTitleColor(UIColor.white, for: .normal)
        self.okBtn.backgroundColor = .gray
        self.okBtn.layer.masksToBounds = false
        self.okBtn.layer.cornerRadius = 10
        self.okBtn.addTarget(self, action: #selector(checkOk(_:)), for: .touchUpInside)
        self.okBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.okBtn)
        NSLayoutConstraint.activate([
            self.okBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -30),
            self.okBtn.heightAnchor.constraint(equalToConstant: 50),
            self.okBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.okBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
        ])
        
    }

    @objc func checkOk(_ sender:Any){
        print("a")
    }
}

