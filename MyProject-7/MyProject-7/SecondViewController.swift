//
//  SecondViewController.swift
//  MyProject-7
//
//  Created by 이윤수 on 2020/12/15.
//

import UIKit


class SecondViewController:UIViewController{
    
    var Scity:String!
    var Sname:String!
    var city: UILabel!
    var name:UILabel!
    var sdw_group:[String]!
    var check_i:Int!
    var ud = UserDefaults.standard
    var move:UIButton!
    var face_btn:UIButton!
    
    override func viewDidLoad() {
        sdw_group = [String]()
        
        sdw_group.append("이윤수")
        sdw_group.append("최영민")
        sdw_group.append("이예슬")
        sdw_group.append("이승민")
        sdw_group.append("김정한")
        sdw_group.append("이수민")
        sdw_group.append("조용욱")
        sdw_group.append("안영현")
        sdw_group.append("류인환")
        
        self.view.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.city = UILabel()
        self.city.frame = CGRect(x: 50, y: 100, width: 100, height: 20)
        self.city.font = UIFont(name: "BMDOHYEON", size: 13)
        
        self.name = UILabel()
        self.name.frame = CGRect(x: 50, y: 150, width: 100, height: 20)
        self.name.font = UIFont(name: "BMDOHYEON", size: 13)
        
       
        
        if self.Scity == "SDW" || self.Scity == "sdw" || self.Scity == "Sdw"{
            for sdw_name in sdw_group{
                if sdw_name == Sname{
                    self.name.text = "\(Sname!)님 아래 버튼을 눌러 본인 얼굴을 등록해주세요."
                    self.name.textAlignment = .left
                    self.name.sizeToFit()
                    
                    self.face_btn = UIButton(type: .system)
                    self.face_btn.frame = CGRect(x: 0, y: 200, width: 20, height: 10)
                    self.face_btn.setTitle("얼굴 등록하기", for: .normal)
                    self.face_btn.sizeToFit()
                    self.face_btn.center.x = self.view.frame.width/2
                    self.face_btn.addTarget(self, action: #selector(faceC(_sender:)), for: .touchUpInside)
                    self.view.addSubview(self.face_btn)
                    
                    break
                }else{
                    self.check_i = 0
                    self.name.text = "\(Sname!)라는 분은 상대원 모임에 없습니다."
                    self.name.textAlignment = .left
                    self.name.sizeToFit()
                }
            }
            self.city.text = "\(Scity!)메신저에 오신걸 환영합니다."
            self.city.textAlignment = .left
            self.city.sizeToFit()
        }else{
            self.city.text = "\(Scity!)는 상대원 모임이 아닙니다."
            self.city.textAlignment = .left
            self.city.sizeToFit()
            self.name.text = "\(Sname!)님! 상대원 모임 아니시면 앱을 삭제해주세요."
            self.name.textAlignment = .left
            self.name.sizeToFit()
        }
        self.view.addSubview(self.city)
        self.view.addSubview(self.name)
    }
    @objc func move_t(_ sender:Any){
        self.dismiss(animated: true){
            let tbc = UITabBarController()
            tbc.selectedIndex = 1
        }
    }
    @objc func faceC(_sender:Any){
        
        print("aa")
        
        let img = UIImagePickerController()
        img.delegate = self
        img.sourceType = .photoLibrary
        img.allowsEditing = true
        
        self.present(img, animated: true)
    }
    
}



extension SecondViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.check_i = 1
        self.ud.setValue("1", forKey: "certified")
        self.ud.setValue(self.Sname, forKey: "name")
        
        let img = info[UIImagePickerController.InfoKey.editedImage]as? UIImage
        
        ud.set(img?.pngData(), forKey: "faceImg")
        
        self.move = UIButton(type: .system)
        self.move.frame = CGRect(x: 0, y: 250, width: 20, height: 20)
        self.move.setTitle("메신저로 이동", for: .normal)
        self.move.sizeToFit()
        self.move.center.x = self.view.frame.width/2
        self.move.addTarget(self, action: #selector(move_t(_:)), for: .touchUpInside)
        self.view.addSubview(self.move)
        
        self.dismiss(animated: true)
    }
}


