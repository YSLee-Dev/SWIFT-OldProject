//
//  SecondViewController.swift
//  MyProject-6
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
        self.city.font = UIFont(name: "BMDOHYEON", size: 15)
        
        self.name = UILabel()
        self.name.frame = CGRect(x: 50, y: 150, width: 100, height: 20)
        self.name.font = UIFont(name: "BMDOHYEON", size: 15)
        
       
        
        if self.Scity == "SDW" || self.Scity == "sdw" || self.Scity == "Sdw"{
            for sdw_name in sdw_group{
                if sdw_name == Sname{
                    self.check_i = 1
                    self.ud.setValue("1", forKey: "certified")
                    self.ud.setValue(self.Sname, forKey: "name")
                    
                    self.name.text = "\(Sname!)님 메신저로 이동하시려면 아래 버튼을 누르세요."
                    self.name.textAlignment = .left
                    self.name.sizeToFit()
                    
                    self.move = UIButton(type: .system)
                    self.move.frame = CGRect(x: 0, y: 250, width: 20, height: 20)
                    self.move.setTitle("메신저로 이동", for: .normal)
                    self.move.sizeToFit()
                    self.move.center.x = self.view.frame.width/2
                    self.move.addTarget(self, action: #selector(move_t(_:)), for: .touchUpInside)
                    self.view.addSubview(self.move)
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
}
