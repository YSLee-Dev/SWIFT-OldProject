//
//  CallViewController.swift
//  MyProject - 9
//
//  Created by 이윤수 on 2021/04/22.
//
// 오토레이아웃 사용

import UIKit

class CallViewController: UIViewController {

    let data = sdw()
    var purpose_data:String!
    var maintitle:UILabel!
    var main_view:UIView!
    var purpose_title:UILabel!
    var purpose:UITextField!
    var people_title:UILabel!
    var people:UITextField!
    var people_select:UIPickerView!
    var ok_Btn:UIButton!
    var cancel_info:UIView!
    var cancel_title:UILabel!
    
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        
        // 메인 뷰
        self.main_view = UIView()
        self.main_view.translatesAutoresizingMaskIntoConstraints = false
        // self.main_view.backgroundColor = .red
        self.view.addSubview(main_view)
        
        self.main_view.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.main_view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.main_view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        // 취소 안내 view
        self.cancel_info = UIView()
        self.cancel_info.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        self.cancel_info.translatesAutoresizingMaskIntoConstraints = false
        self.main_view.addSubview(cancel_info)
        self.cancel_info.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.cancel_info.heightAnchor.constraint(equalTo: self.cancel_info.widthAnchor, multiplier: 0.1).isActive = true
        self.cancel_info.topAnchor.constraint(equalTo: self.main_view.topAnchor).isActive = true
        self.cancel_info.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        // 취소 안내 타이틀
        self.cancel_title = UILabel()
        self.cancel_title.text = "If you'd like to cancel, drop it down"
        self.cancel_title.font = UIFont.boldSystemFont(ofSize: 14)
        self.cancel_title.translatesAutoresizingMaskIntoConstraints = false
        self.main_view.addSubview(cancel_title)
        self.cancel_title.centerYAnchor.constraint(equalTo: self.cancel_info.centerYAnchor).isActive = true
        self.cancel_title.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
     
        
        // 메인 타이틀
        self.maintitle = UILabel()
        self.maintitle.text = "Please select a purpose and a user"
        self.maintitle.font = UIFont.boldSystemFont(ofSize: 16)
        self.main_view.addSubview(maintitle)
        self.maintitle.translatesAutoresizingMaskIntoConstraints = false
        self.maintitle.centerXAnchor.constraint(equalTo: self.main_view.centerXAnchor).isActive = true
        self.maintitle.topAnchor.constraint(equalTo: self.main_view.topAnchor, constant: 75).isActive = true
        
       
        // 목적 타이틀
        self.purpose_title = UILabel()
        self.purpose_title.text = "purpose"
        self.main_view.addSubview(purpose_title)
        self.purpose_title.translatesAutoresizingMaskIntoConstraints = false
        self.purpose_title.topAnchor.constraint(equalTo: self.maintitle.bottomAnchor, constant: 40).isActive = true
        self.purpose_title.leadingAnchor.constraint(equalTo: self.main_view.leadingAnchor, constant: 0).isActive = true
        
        // 목적 텍스트 필드
        self.purpose = UITextField()
        self.purpose.borderStyle = .roundedRect
        self.purpose.delegate = self
        self.purpose.translatesAutoresizingMaskIntoConstraints = false
        self.purpose.placeholder = "Purpose"
        self.main_view.addSubview(purpose)
        self.purpose.topAnchor.constraint(equalTo: self.maintitle.bottomAnchor, constant: 40).isActive = true
        self.purpose.trailingAnchor.constraint(equalTo: self.main_view.trailingAnchor, constant: 0).isActive = true
        self.purpose.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.purpose.centerYAnchor.constraint(equalTo: self.purpose_title.centerYAnchor, constant: 0).isActive = true
        
        // 사람 타이틀
        self.people_title = UILabel()
        self.people_title.text = "Requester"
        self.main_view.addSubview(people_title)
        self.people_title.translatesAutoresizingMaskIntoConstraints = false
        self.people_title.topAnchor.constraint(equalTo: self.purpose_title.bottomAnchor, constant: 40).isActive = true
        self.people_title.leadingAnchor.constraint(equalTo: self.main_view.leadingAnchor, constant: 0).isActive = true
        
        // 사람 picker
        self.people_select = UIPickerView()
        self.people_select.delegate = self
        self.people_select.dataSource = self
        self.main_view.addSubview(people_select)
        self.people_select.translatesAutoresizingMaskIntoConstraints = false
        self.people_select.topAnchor.constraint(equalTo: self.purpose_title.bottomAnchor, constant: 40).isActive = true
        self.people_select.trailingAnchor.constraint(equalTo: self.main_view.trailingAnchor, constant: 0).isActive = true
        self.people_select.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.people_select.centerYAnchor.constraint(equalTo: self.people_title.centerYAnchor, constant: 0).isActive = true
        
        // ok버튼
        self.ok_Btn = UIButton(type: .system)
        self.ok_Btn.setTitle("OK", for: .normal)
        self.ok_Btn.translatesAutoresizingMaskIntoConstraints = false
        self.ok_Btn.addTarget(self, action: #selector(request_server(_:)), for: .touchUpInside)
        self.main_view.addSubview(self.ok_Btn)
        self.ok_Btn.topAnchor.constraint(equalTo: self.people_select.bottomAnchor, constant: 20).isActive = true
        self.ok_Btn.centerXAnchor.constraint(equalTo: self.main_view.centerXAnchor).isActive = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
       
    }
    
    @objc func request_server(_ sender:Any){
        if purpose_data == nil{
            let alert = UIAlertController(title: "Please enter your purpose.", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            
            self.present(alert, animated: true)
        }else{
            print("a")
        }
    }
    
}
extension CallViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        self.purpose_data =  textField.text
        
    }
}

extension CallViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // 한 뷰에 Picker가 몇개 있는지
    }
    
    // 피커부분 구현
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.sdwList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data.sdwList[row]
    }
    
}

