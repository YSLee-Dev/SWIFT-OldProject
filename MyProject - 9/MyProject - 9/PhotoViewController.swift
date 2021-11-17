//
//  PhotoViewController.swift
//  MyProject - 9
//
//  Created by 이윤수 on 2021/03/22.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var ud = UserDefaults.standard
    var Mtitle:UILabel!
    var count:Int = 0
    var userIcon_view:UIView!
    var userIcon:UIImageView!

    override func viewDidLoad() {
        
        // 유저 아이콘 뷰
        self.userIcon_view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        // 유저 아이콘
        self.userIcon = UIImageView(image: UIImage(named:"user.png"))
        self.userIcon.frame = CGRect(x: 0, y: 10, width: 23, height: 25)
        self.userIcon.isUserInteractionEnabled = true
        self.userIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginP(_sender:))))
        self.userIcon_view.addSubview(userIcon)
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "SDW CREW Photo(수정 중)"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.userIcon_view)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        // 로그인 검증
        if(ud.string(forKey: "loginC")=="O"){
            self.count = 1
            
            // 사진부분 1
            let uv1 = UIImageView(image: UIImage(named:"3.19_1.jpeg"))
            uv1.frame = CGRect(x: 0, y: 200, width: 130, height: 100)
            uv1.center.x = self.view.frame.width/2-90
            self.view.addSubview(uv1)
            let uv1_t = UILabel(frame: CGRect(x: 0, y: 305, width: 100, height: 100))
            uv1_t.text = "3/19"
            uv1_t.sizeToFit()
            uv1_t.center.x = self.view.frame.width/2-90
            self.view.addSubview(uv1_t)
            
            // 사진부분 2
            let uv2 = UIImageView(image: UIImage(named:"3.07_1.jpeg"))
            uv2.frame = CGRect(x: 0, y: 200, width: 130, height: 100)
            uv2.center.x = self.view.frame.width/2+90
            self.view.addSubview(uv2)
            let uv2_t = UILabel(frame: CGRect(x: 0, y: 305, width: 100, height: 100))
            uv2_t.text = "3/07"
            uv2_t.sizeToFit()
            uv2_t.center.x = self.view.frame.width/2+90
            self.view.addSubview(uv2_t)
            
        }else{
            self.view.removeFromSuperview()
            let alert = UIAlertController(title: "Please Login", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default){_ in
                self.tabBarController?.selectedIndex = 0
            })
            self.present(alert, animated: true)
        }
    }
    
    @objc func loginP(_sender:Any){
        
        let alert = UIAlertController(title: "Memu", message: "Select the menu you want", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login Page", style: .default){_ in
            let lv =  LoginViewController()
            lv.modalPresentationStyle = .fullScreen
            
            self.present(lv, animated: true)
        })
        alert.addAction(UIAlertAction(title: "Help", style: .default){_ in
            
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        self.present(alert, animated: true)
    }

}


