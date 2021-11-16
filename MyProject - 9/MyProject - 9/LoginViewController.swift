//
//  LoginViewController.swift
//  MyProject - 9
//
//  Created by 이윤수 on 2021/03/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var id_ul:UILabel!
    var id_ip:UITextField!
    var nextBtn:UIButton!
    var tfvalue:String!
    var ud = UserDefaults.standard
    var okBtn:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.id_ul = UILabel()
        
        if(ud.string(forKey: "loginC")=="O"){
            self.id_ul.text = "Logout complete"
            ud.setValue("X", forKey: "loginC")
            
            self.backBtn()
            
            }else{
            self.id_ul.text = "Insert Code"
            self.id_ip = UITextField()
            self.id_ip.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
            self.id_ip.center.x = self.view.frame.width/2
            self.id_ip.center.y = self.view.frame.height/2-100
            self.id_ip.borderStyle = .roundedRect
            self.id_ip.delegate = self
            self.view.addSubview(id_ip)
                
            self.nextBtn = UIButton(type: .system)
            self.nextBtn.setTitle("Login", for: .normal)
            self.nextBtn.frame = CGRect(x: 0, y: 470, width: 100, height: 100)
            self.nextBtn.center.x = self.view.frame.width/2
            self.nextBtn.center.y = self.view.frame.height/2-50
            self.nextBtn.addTarget(self, action: #selector(Vcheck(_sender:)), for: .touchUpInside)
                
            self.view.addSubview(nextBtn)
        }
        self.id_ul.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.id_ul.sizeToFit()
        self.id_ul.center.x = self.view.frame.width/2
        self.id_ul.center.y = self.view.frame.height/2-130
        self.view.addSubview(id_ul)
        
        
    }
    @objc func backS(_sender:Any){
        self.dismiss(animated: true)
    }
    func backBtn(){
        self.okBtn = UIButton(type: .system)
        self.okBtn.setTitle("OK", for: .normal)
        self.okBtn.frame = CGRect(x: 0, y: 470, width: 100, height: 100)
        self.okBtn.center.x = self.view.frame.width/2
        self.okBtn.center.y = self.view.frame.height/2-50
        self.okBtn.addTarget(self, action: #selector(backS(_sender:)), for: .touchUpInside)
        self.view.addSubview(okBtn)
    }
}

extension LoginViewController:UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.tfvalue = textField.text
    }
    
    @objc func Vcheck(_sender:Any){
        if(self.tfvalue == "SDW"){
            UserDefaults.standard.setValue("O", forKey: "loginC")
            
            let alert = UIAlertController(title: "Login complete", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default){_ in
                self.dismiss(animated: true){
                    
                }
            })
            self.present(alert, animated: true)
            
        }else{
            let alert = UIAlertController(title: "The code is different.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(alert, animated: true)
        }
    }
}

