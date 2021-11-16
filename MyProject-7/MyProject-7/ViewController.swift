//
//  ViewController.swift
//  MyProject-7
//
//  Created by 이윤수 on 2020/12/10.
//

import UIKit

class ViewController: UIViewController {
    
    var city_tf : UITextField!
    var city: UILabel!
    var name_tf: UITextField!
    var name:UILabel!
    var nextBtn:UIButton!
    var question:UIButton!
    var ud = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        if ud.string(forKey: "certified") == "1"{
            self.tabBarController?.selectedIndex = 1
            print("로그인 사용자")
        }else{
            viewload()
        }
    }
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        city?.removeFromSuperview()
        city_tf?.removeFromSuperview()
        name?.removeFromSuperview()
        name_tf?.removeFromSuperview()
        nextBtn?.removeFromSuperview()
        question?.removeFromSuperview()
    }
    func viewload(){
        print("UI그리는중")
        city_tf = UITextField()
        city_tf.frame = CGRect(x: 0, y: 250, width: 300, height: 40)
        city_tf.center = CGPoint(x:  self.view.frame.width/2, y:250)
        city_tf.borderStyle = .roundedRect
        city_tf.alpha = 0
        city_tf.font = UIFont(name: "BMDOHYEON", size: 12)
        self.view.addSubview(city_tf)
        
        city_tf.delegate = self
        
        city = UILabel()
        city.text = "상대원 모임 이름을 영어로 입력하세요. (크루 제외)"
        city.frame = CGRect(x: 0, y: 200, width: 180, height: 20)
        city.sizeToFit()
        city.center = CGPoint(x: self.view.frame.width/2, y: 200)
        city.alpha = 0
        city.font = UIFont(name: "BMDOHYEON", size: 15)
        self.view.addSubview(city)
        
        UIView.animate(withDuration: 0.5){
            self.city.alpha = 1
        }
        UIView.animate(withDuration: 1.0){
            self.city_tf.alpha = 1
        }
        
        name_tf = UITextField()
        name_tf.frame = CGRect(x: 0, y: 270, width: 300, height: 40)
        name_tf.center = CGPoint(x: self.view.frame.width/2, y:270)
        name_tf.borderStyle = .roundedRect
        name_tf.alpha = 0
        name_tf.font = UIFont(name: "BMDOHYEON", size: 12)
        name_tf.delegate = self
        
        name = UILabel()
        name.text = "본인 이름을 입력하세요."
        name.frame = CGRect(x: 0, y: 220, width: 180, height: 20)
        name.sizeToFit()
        name.center = CGPoint(x: self.view.frame.width/2, y: 220)
        name.alpha = 0
        name.font = UIFont(name: "BMDOHYEON", size: 15)
        
        nextBtn = UIButton(type: .system)
        nextBtn.frame = CGRect(x: 0, y: 350, width: 30, height: 20)
        nextBtn.setTitle("로그인", for: .normal)
        nextBtn.sizeToFit()
        nextBtn.center = CGPoint(x: self.view.frame.width/2, y: 350)
        nextBtn.alpha = 0
        nextBtn.addTarget(self, action: #selector(checkinfo(_:)), for: .touchUpInside)
        
        question = UIButton(type: .system)
        question.frame = CGRect(x: 0, y: 400, width: 500, height: 20)
        question.setTitle("혹시 글자 표시가 안되시나요?🧐", for: .normal)
        question.sizeToFit()
        question.center.x = self.view.frame.width/2
        question.alpha = 0
        question.addTarget(self, action: #selector(que_in(_:)), for: .touchUpInside)
    }
}

extension ViewController:UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(textField.text!.count)+Int(string.count) > 10{
            return false
        }else{
            return true
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print(textField)
        UIView.animate(withDuration: 1.0){
            self.city_tf.center = CGPoint(x: self.view.frame.width/2, y: 150)
            self.city.center = CGPoint(x: self.view.frame.width/2, y: 100)
        }
        self.view.addSubview(self.name_tf)
        self.view.addSubview(self.name)
        self.view.addSubview(self.nextBtn)
        self.view.addSubview(self.question)
        
        UIView.animate(withDuration: 1.5){
            self.name_tf.alpha = 1
            self.name.alpha = 1
            self.nextBtn.alpha = 1
            self.question.alpha = 1
            
        }
        
    }
    
    @objc func checkinfo(_ sender: Any){
        guard let city:String = self.city_tf.text else {
            return
        }
        guard let name:String = self.name_tf.text else {
            return
        }
        
        let alert = UIAlertController(title: "정보를 확인해주세요.", message: "영문명: \(city) \n 이름: \(name)\n저장된 정보는 수정하실 수 없습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "O", style: .default){_ in
            let svc = SecondViewController()
            svc.Scity = city
            svc.Sname = name
            
            self.city_tf.isEnabled = false
            self.city_tf.backgroundColor = UIColor.lightGray
            self.name_tf.isEnabled = false
            self.name_tf.backgroundColor = UIColor.lightGray
            
            svc.modalPresentationStyle = .fullScreen
            self.present(svc, animated: true)
            
        })
        alert.addAction(UIAlertAction(title: "X", style: .destructive){_ in
            
        })
        self.present(alert, animated: true)
    }
    
    @objc func que_in(_ sender:Any){
        let alert = UIAlertController(title: "글자 표시가 안되는 이유", message: "이 앱은 완성된 글자만 표시할 수 있습니다. \n '뷁'같은 외계어는 사용하실 수 없습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .destructive){_ in
            
        })
        self.present(alert, animated: true)
    }
}
