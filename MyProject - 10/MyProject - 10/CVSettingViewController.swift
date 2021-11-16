//
//  CVSettingViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/07/12.
//

import UIKit

protocol cvs {
    func cvdata(gender:String, old:Int)
}

class CVSettingViewController: UIViewController {

    var green = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
    var gray = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0)
    let multiplier:CGFloat = 0.93
    var margin:CGFloat!
    var cornerRadius:CGFloat = 12
    
    var border:UIView!
    var Mtitle:UILabel!
    var scrollView:UIScrollView!
    var stackView:UIStackView!
    var okBtn:UIButton!
    
    var men:UIButton!
    var woman:UIButton!
    var genderC:String!
    var oldtf:UITextField!
    var oldC:Int!
    var oldString:String!
    var IDVcount:Int!
    
    var seoul:UIButton!
    var busan:UIButton!
    var daegu:UIButton!
    var incheon:UIButton!
    var gwanggu:UIButton!
    var daejeon:UIButton!
    var ulsan:UIButton!
    var sejong:UIButton!
    
    var cvsDelegate:cvs?
    
    func viewSetting(Mview:UIView, title:UILabel, ment:String,Vheight: CGFloat){
        title.text = ment
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.translatesAutoresizingMaskIntoConstraints = false
        Mview.addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: Mview.leadingAnchor),
            title.topAnchor.constraint(equalTo: Mview.topAnchor)
        ])
        
        Mview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(Mview)
        NSLayoutConstraint.activate([
            Mview.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -(self.margin)*2),
            Mview.heightAnchor.constraint(equalToConstant: Vheight)
        ])
    }
    
    func likeDiseaseView(button:UIButton, title:String, i_view:UIView, i_title:UILabel, leftView:UIView, upView:UIView){
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(areaC(_:)), for: .touchUpInside)
        button.backgroundColor = self.gray
        button.tag = self.IDVcount
        button.setTitleColor(UIColor.black, for: .normal)
        i_view.addSubview(button)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: i_view.widthAnchor, multiplier: 0.25, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        if self.IDVcount == 1{
            button.leadingAnchor.constraint(equalTo: i_title.leadingAnchor, constant: 5).isActive = true
            button.topAnchor.constraint(equalTo: i_title.bottomAnchor, constant: 10).isActive = true
        }else if self.IDVcount < 5{
            button.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10).isActive = true
            button.topAnchor.constraint(equalTo: i_title.bottomAnchor, constant: 10).isActive = true
        }else if self.IDVcount == 5{
            button.leadingAnchor.constraint(equalTo: i_title.leadingAnchor, constant: 5).isActive = true
            button.topAnchor.constraint(equalTo: upView.bottomAnchor, constant: 10).isActive = true
        }else if self.IDVcount < 9{
            button.leadingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: 10).isActive = true
            button.topAnchor.constraint(equalTo: upView.bottomAnchor, constant: 10).isActive = true
        }
        
        
        
        self.IDVcount+=1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.IDVcount = 1
        
        //MARK: 취소 버튼
        let closeBtn = UIButton(type: .custom)
        closeBtn.setTitle("취소", for: .normal)
        closeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        closeBtn.setTitleColor(self.green, for: .normal)
        closeBtn.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        closeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(closeBtn)
        NSLayoutConstraint.activate([
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.heightAnchor.constraint(equalToConstant: 30),
            closeBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        //MARK: Title
        self.Mtitle = UILabel()
        self.Mtitle.text = "맞춤설정"
        self.Mtitle.font = UIFont.boldSystemFont(ofSize: 27)
        self.Mtitle.translatesAutoresizingMaskIntoConstraints = false
        self.Mtitle.adjustsFontSizeToFitWidth = true
        self.view.addSubview(self.Mtitle)
        
        NSLayoutConstraint.activate([
            self.Mtitle.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 20),
            self.Mtitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin)
        ])
        
        //MARK: 스크롤뷰, 스택 뷰
        self.scrollView = UIScrollView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.alwaysBounceVertical = true
        self.view.addSubview(self.scrollView)
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.Mtitle.bottomAnchor, constant: 20),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor)
        ])
        
        self.stackView = UIStackView()
        self.stackView.axis = .vertical
        self.stackView.alignment = .center
        self.stackView.distribution = .fill
        self.stackView.spacing = 10
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        self.okBtn = UIButton(type: .custom)
        self.okBtn.setTitle("완료", for: .normal)
        self.okBtn.addTarget(self, action: #selector(checkOk(_:)), for: .touchUpInside)
        self.okBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.okBtn.setTitleColor(UIColor.white, for: .normal)
        self.okBtn.backgroundColor = self.green
        self.okBtn.layer.masksToBounds = false
        self.okBtn.layer.cornerRadius = 10
        self.okBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.okBtn)
        NSLayoutConstraint.activate([
            self.okBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -(self.margin*2)),
            self.okBtn.heightAnchor.constraint(equalToConstant: 50),
            self.okBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.okBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        
        gender()
        old()
        likeDisease()
    }
    
    //MARK: 성별
    func gender(){
        let g_view = UIView()
        let gm_title = UILabel()
        self.men = UIButton(type: .custom)
        self.woman = UIButton(type: .custom)
        
        gm_title.text = "성별"
        gm_title.font = UIFont.boldSystemFont(ofSize: 18)
        gm_title.translatesAutoresizingMaskIntoConstraints = false
        g_view.addSubview(gm_title)
        NSLayoutConstraint.activate([
            gm_title.leadingAnchor.constraint(equalTo: g_view.leadingAnchor),
            gm_title.topAnchor.constraint(equalTo: g_view.topAnchor, constant: 20)
        ])
        
        self.woman.translatesAutoresizingMaskIntoConstraints = false
        self.woman.setTitle("여", for: .normal)
        self.woman.layer.masksToBounds = true
        self.woman.layer.cornerRadius = 22.5
        self.woman.backgroundColor = self.gray
        self.woman.setTitleColor(UIColor.black, for: .normal)
        self.woman.addTarget(self, action: #selector(womanC(_:)), for: .touchUpInside)
        g_view.addSubview(self.woman)
        NSLayoutConstraint.activate([
            self.woman.widthAnchor.constraint(equalToConstant: 45),
            self.woman.heightAnchor.constraint(equalToConstant: 45),
            self.woman.centerYAnchor.constraint(equalTo: gm_title.centerYAnchor),
            self.woman.trailingAnchor.constraint(equalTo: g_view.trailingAnchor)
        ])
        
        self.men.translatesAutoresizingMaskIntoConstraints = false
        self.men.setTitle("남", for: .normal)
        self.men.layer.masksToBounds = true
        self.men.layer.cornerRadius = 22.5
        self.men.setTitleColor(UIColor.white, for: .normal)
        self.men.addTarget(self, action: #selector(menC(_:)), for: .touchUpInside)
        g_view.addSubview(self.men)
        NSLayoutConstraint.activate([
            self.men.widthAnchor.constraint(equalToConstant: 45),
            self.men.heightAnchor.constraint(equalToConstant: 45),
            self.men.centerYAnchor.constraint(equalTo: self.woman.centerYAnchor),
            self.men.trailingAnchor.constraint(equalTo: self.woman.leadingAnchor, constant: -20)
        ])
        
        if self.genderC == "남"{
            self.men.backgroundColor = self.green
            self.woman.backgroundColor = self.gray
            self.men.setTitleColor(UIColor.white, for: .normal)
            self.woman.setTitleColor(UIColor.black, for: .normal)
        }else{
            self.men.backgroundColor = self.gray
            self.woman.backgroundColor = self.green
            self.men.setTitleColor(UIColor.black, for: .normal)
            self.woman.setTitleColor(UIColor.white, for: .normal)
        }
        
        g_view.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(g_view)
        NSLayoutConstraint.activate([
            g_view.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -(self.margin)*2),
            g_view.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    //MARK: 나이
    func old() {
        let o_view = UIView()
        let o_title = UILabel()
        self.oldtf = UITextField()
        let toolbar = UIToolbar()
        
        viewSetting(Mview: o_view, title: o_title, ment: "나이", Vheight: 60)
        
        toolbar.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        let ok = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(endEditing(_:)))
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flex, ok], animated: true)
        toolbar.sizeToFit()
        toolbar.barTintColor = .white
        
        
        oldtf.translatesAutoresizingMaskIntoConstraints = false
        oldtf.keyboardType = .numberPad
        oldtf.borderStyle = .roundedRect
        
        oldtf.delegate = self
        oldtf.text = String(self.oldC)
        oldtf.inputAccessoryView = toolbar
        
        o_view.addSubview(oldtf)
        NSLayoutConstraint.activate([
            self.oldtf.widthAnchor.constraint(equalToConstant: 45),
            self.oldtf.heightAnchor.constraint(equalToConstant: 30),
            self.oldtf.centerYAnchor.constraint(equalTo: o_title.centerYAnchor),
            self.oldtf.trailingAnchor.constraint(equalTo: o_view.trailingAnchor)
        ])
    }
    
    //MARK: 관심질환
    func likeDisease(){
        let i_view = UIView()
        let i_title = UILabel()
        self.seoul = UIButton(type: .custom)
        self.busan = UIButton(type: .custom)
        self.daegu = UIButton(type: .custom)
        self.incheon = UIButton(type: .custom)
        self.gwanggu = UIButton(type: .custom)
        self.daejeon = UIButton(type: .custom)
        self.ulsan = UIButton(type: .custom)
        self.sejong = UIButton(type: .custom)
        
        viewSetting(Mview: i_view, title: i_title, ment: "지역", Vheight: 100)
        i_view.backgroundColor = .red
        
        likeDiseaseView(button: self.seoul, title: "서울", i_view: i_view, i_title: i_title, leftView: seoul, upView: self.seoul)
        likeDiseaseView(button: self.busan, title: "부산", i_view: i_view, i_title: i_title, leftView: seoul, upView: self.busan)
        likeDiseaseView(button: self.daegu, title: "대구", i_view: i_view, i_title: i_title, leftView: busan, upView: self.daegu)
        likeDiseaseView(button: self.incheon, title: "인천", i_view: i_view, i_title: i_title, leftView: daegu, upView: self.incheon)
        likeDiseaseView(button: self.gwanggu, title: "광주", i_view: i_view, i_title: i_title, leftView: gwanggu, upView: self.seoul)
        likeDiseaseView(button: self.daejeon, title: "대전", i_view: i_view, i_title: i_title, leftView: gwanggu, upView: self.busan)
        likeDiseaseView(button: self.ulsan, title: "울산", i_view: i_view, i_title: i_title, leftView: daejeon, upView: self.daegu)
        likeDiseaseView(button: self.sejong, title: "세종", i_view: i_view, i_title: i_title, leftView: ulsan, upView: self.incheon)
        
        
    }
    
    @objc func close(_ sender:Any){
        self.dismiss(animated: true)
    }
    
    @objc func checkOk(_ sender:Any){
        if self.oldC == nil{
            self.oldC = 0
        }
        
        self.cvsDelegate?.cvdata(gender: self.genderC, old: self.oldC)
        self.dismiss(animated: true)
    }
    
    @objc func menC(_ sender:Any){
        self.woman.backgroundColor = self.gray
        self.men.backgroundColor = self.green
        self.men.setTitleColor(UIColor.white, for: .normal)
        self.woman.setTitleColor(UIColor.black, for: .normal)
        self.genderC = "남"
    }
    
    @objc func womanC(_ sender:Any){
        self.woman.backgroundColor = self.green
        self.men.backgroundColor = self.gray
        self.men.setTitleColor(UIColor.black, for: .normal)
        self.woman.setTitleColor(UIColor.white, for: .normal)
        self.genderC = "여"
    }
    
    @objc func endEditing(_ sender:Any){
        self.view.endEditing(true)
    }
    
    @objc func areaC(_ sender:Any){
        let tab = Int((sender as AnyObject).tag)
        
        if tab == 1{
            self.seoul.backgroundColor = self.green
            self.seoul.setTitleColor(UIColor.white, for: .normal)
        }
    }
}

extension CVSettingViewController:UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        self.oldString = textField.text
        self.oldC = Int(self.oldString)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count + string.count > 2{
            return false
        }else{
            return true
        }
    }
    
}
