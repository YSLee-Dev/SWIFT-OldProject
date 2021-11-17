//
//  SettingViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/05/13.
//

import UIKit

class SettingViewController:UIViewController{
    
    var loginCheck = UserDefaults.standard
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        let cancel = UIButton()
        cancel.setTitle("취소", for: .normal)
        cancel.translatesAutoresizingMaskIntoConstraints = false
        cancel.setTitleColor(.black, for: .normal)
        cancel.addTarget(self, action: #selector(cancel(_:)), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: cancel)
        self.navigationItem.largeTitleDisplayMode = .never
        
        
        // MARK: 사용자 정보 표시
        let UserView = UIView()
        UserView.backgroundColor = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
        UserView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(UserView)
        NSLayoutConstraint.activate([
            UserView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            UserView.heightAnchor.constraint(equalToConstant: 80),
            UserView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        ])
        
        // UI뷰
        let UserView_info = UIView()
        UserView_info.translatesAutoresizingMaskIntoConstraints = false
        UserView.addSubview(UserView_info)
        NSLayoutConstraint.activate([
            UserView_info.widthAnchor.constraint(equalTo: UserView.widthAnchor, multiplier: 0.93),
            UserView_info.heightAnchor.constraint(equalTo: UserView.heightAnchor),
            UserView_info.centerXAnchor.constraint(equalTo: UserView.centerXAnchor),
            UserView_info.centerYAnchor.constraint(equalTo: UserView.centerYAnchor)
        ])
        
        let UserView_name = UILabel()
        UserView_name.text = "이윤수님 환영합니다."
        UserView_name.textColor = .white
        UserView_name.font = UIFont.boldSystemFont(ofSize: 19)
        UserView_name.translatesAutoresizingMaskIntoConstraints = false
        UserView_info.addSubview(UserView_name)
        NSLayoutConstraint.activate([
            UserView_name.centerYAnchor.constraint(equalTo: UserView_info.centerYAnchor)
        ])
        
        // 로그인/로그아웃
        let UserView_Btn = UIButton()
        UserView_Btn.setTitle("로그인", for: .normal)
        UserView_Btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        UserView_Btn.setTitleColor(UIColor.white, for: .normal)
        UserView_Btn.layer.borderWidth = 1
        UserView_Btn.layer.borderColor = UIColor.white.cgColor
        UserView_Btn.layer.cornerRadius = 5
        UserView_Btn.translatesAutoresizingMaskIntoConstraints = false
        UserView.addSubview(UserView_Btn)
        NSLayoutConstraint.activate([
            UserView_Btn.widthAnchor.constraint(equalToConstant: 50),
            UserView_Btn.heightAnchor.constraint(equalToConstant: 30),
            UserView_Btn.trailingAnchor.constraint(equalTo: UserView.trailingAnchor, constant: -20),
            UserView_Btn.centerYAnchor.constraint(equalTo: UserView.centerYAnchor)
        ])
        
        
        
        // 임시 로그인 용 버튼
        let loginBtn = UISwitch()
        loginBtn.addTarget(self, action: #selector(isOn(sender:)), for: .valueChanged)
        
        if loginCheck.string(forKey: "loginOK") == "1"{
            loginBtn.isOn = true
        }else{
            loginBtn.isOn = false
        }
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginBtn)
        NSLayoutConstraint.activate([
            loginBtn.widthAnchor.constraint(equalToConstant: 30),
            loginBtn.heightAnchor.constraint(equalToConstant: 30),
            loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        
        
    }
    
    @objc func cancel(_ sender:Any){
        self.dismiss(animated: true)
    }
    
    @objc func isOn(sender:UISwitch){
        
        if sender.isOn{
            loginCheck.setValue(1, forKey: "loginOK")
            print("로그인 완료")
        }else{
            loginCheck.setValue(0, forKey: "loginOK")
            print("로그아웃")
        }
    }
    
}
