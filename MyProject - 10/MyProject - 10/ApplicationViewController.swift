//
//  ApplicationViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/05/25.
//

import UIKit

class ApplicationViewController: UIViewController {
    
    //MARK: 선언부분
    var scrollView:UIScrollView!
    var stackView:UIStackView!
    var data:ct!
    var city:[String]!
    var sigungu:[String:[String]]!
    var selectRow = 0
    var gray = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0)
    var green = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
    var alert = UIAlertController()
    var keyHeight:CGFloat = 0
    var kCount = true
    var Mtitle:UILabel!
    var border:UIView!
    var closeBtn:UIButton!
    
    let FYbtn = UIButton()
    let FNbtn = UIButton()
    let SYbtn = UIButton()
    let SNbtn = UIButton()
    let tf = UITextField()
    let picker = UIPickerView()
    let Stf = UITextField()
    let Tbtn = UIButton()
    let Fobtn = UIButton()
    let Spicker = UIPickerView()
    let Fotf = UITextField()
    let FIbtn = UIButton()
    let Finbtn = UIButton()
    
    var margin:CGFloat!
    
    var citySR:String!
    var sigunguSR:String!
    var hospital:[String]!
    var seleHo:String!
    
    var check1:String = "미동의"
    var check2:String = "미동의"
    var check3:String = "미동의"
    var check4:String = "미동의"
    
    //MARK: 시스템 응답 뷰
    func systemView(Rview:UIView, Hview:UIView, Ment:String, title:UILabel){
        
        title.text = Ment
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.numberOfLines = 3
        title.adjustsFontSizeToFitWidth = true
        title.lineBreakMode = .byCharWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        Hview.addSubview(title)
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: Hview.topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: Hview.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: Hview.trailingAnchor, constant: -10),
        ])
        
        Hview.backgroundColor = .white
        Hview.layer.borderWidth = 1.5
        Hview.layer.borderColor = self.gray.cgColor
        Hview.layer.masksToBounds = false
        Hview.layer.cornerRadius = 10
        Hview.translatesAutoresizingMaskIntoConstraints = false
        Rview.addSubview(Hview)
        NSLayoutConstraint.activate([
            Hview.widthAnchor.constraint(equalTo: Rview.widthAnchor, multiplier: 0.8),
            Hview.heightAnchor.constraint(equalTo: Rview.heightAnchor),
            Hview.leadingAnchor.constraint(equalTo: Rview.leadingAnchor, constant: self.margin)
        ])
    }
    
    func systemBtn(Hview:UIView, Btn:UIButton, title:String){
        
        Btn.setTitle(title, for: .normal)
        Btn.translatesAutoresizingMaskIntoConstraints = false
        Btn.setTitleColor(UIColor.black, for: .normal)
        Btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        Btn.layer.masksToBounds = false
        Btn.layer.cornerRadius = 10
        Btn.layer.backgroundColor = self.gray.cgColor
        Btn.translatesAutoresizingMaskIntoConstraints = false
        
        Hview.addSubview(Btn)
        NSLayoutConstraint.activate([
            Btn.widthAnchor.constraint(equalTo: Hview.widthAnchor, multiplier: 0.95),
            Btn.heightAnchor.constraint(equalToConstant: 45),
            Btn.centerXAnchor.constraint(equalTo: Hview.centerXAnchor),
        ])
    }
    
    func UserView(Rview:UIView, Hview:UIView, title:UILabel, Ment:String){
        
        title.text = Ment
        title.font = UIFont.boldSystemFont(ofSize: 15)
        title.numberOfLines = .max
        title.textColor = .white
        title.lineBreakMode = .byCharWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        Hview.addSubview(title)
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: Hview.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: Hview.centerYAnchor)
        ])
        
        Hview.backgroundColor = self.green
        Hview.layer.masksToBounds = false
        Hview.layer.cornerRadius = 10
        Hview.translatesAutoresizingMaskIntoConstraints = false
        Rview.addSubview(Hview)
        NSLayoutConstraint.activate([
            Hview.widthAnchor.constraint(equalTo: Rview.widthAnchor, multiplier: 0.8),
            Hview.heightAnchor.constraint(equalTo: Rview.heightAnchor),
            Hview.trailingAnchor.constraint(equalTo: Rview.trailingAnchor, constant: -self.margin)
        ])
    }
    
    func animateBtn(Ybtn:UIButton, Nbtn:UIButton){
        UIView.animate(withDuration: 0.2, animations: {
            Ybtn.isEnabled = false
            Ybtn.alpha = 0.4
            Nbtn.isEnabled = false
            Nbtn.alpha = 0.4
        })
    }
    
    func animateView(view:UIView, time:Double){
        UIView.animate(withDuration: time, animations: {
            view.alpha = 1
        })
    }
    
    func tfSet(tf:UITextField, picker:UIPickerView, view:UIView){
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.dataSource = self
        picker.delegate = self
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.inputView = picker
        tf.borderStyle = .none
        tf.backgroundColor = self.gray
        tf.layer.masksToBounds = false
        tf.layer.cornerRadius = 10
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.textAlignment = .center
        tf.tintColor = .clear
        tf.autocorrectionType = .no
        
        view.addSubview(tf)
        
        NSLayoutConstraint.activate([
            tf.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    func toolbarSet(toolbar:UIToolbar, btn:UIBarButtonItem){
        let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flex, btn], animated: true)
        toolbar.sizeToFit()
        toolbar.barTintColor = .white
        toolbar.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        
        let CTD = CTD()
        self.data = CTD.ct_data[self.selectRow]
        self.city = CTD.city
        self.sigungu = CTD.sigungu
        
        self.view.backgroundColor = .white
        
        //MARK: 취소 버튼
        self.closeBtn = UIButton()
        self.closeBtn.setTitle("취소", for: .normal)
        self.closeBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.closeBtn.setTitleColor(self.green, for: .normal)
        self.closeBtn.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        self.closeBtn.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.closeBtn)
        NSLayoutConstraint.activate([
            self.closeBtn.widthAnchor.constraint(equalToConstant: 30),
            self.closeBtn.heightAnchor.constraint(equalToConstant: 30),
            self.closeBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.closeBtn.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        //MARK: Title
        self.Mtitle = UILabel()
        self.Mtitle.text = "신청하기"
        self.Mtitle.font = UIFont.boldSystemFont(ofSize: 27)
        self.Mtitle.translatesAutoresizingMaskIntoConstraints = false
        self.Mtitle.adjustsFontSizeToFitWidth = true
        self.view.addSubview(self.Mtitle)
        
        NSLayoutConstraint.activate([
            self.Mtitle.topAnchor.constraint(equalTo: self.closeBtn.bottomAnchor, constant: 20),
            self.Mtitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin)
        ])
        
        
        self.scrollView = UIScrollView()
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.backgroundColor = .white
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.Mtitle.bottomAnchor, constant: 10),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        self.stackView = UIStackView()
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .center
        self.stackView.spacing = 15
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        firstQ()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    //MARK: 처음 질문
    func firstQ(){
        let Rview = UIView()
        let Hview = UIView()
        let title = UILabel()
        
        systemView(Rview: Rview, Hview: Hview, Ment: (self.data.Stitle)+"을/를 신청하시겠습니까?", title: title)
        
        systemBtn(Hview: Hview, Btn: self.FYbtn, title: "네, 신청하겠습니다.")
        self.FYbtn.addTarget(self, action: #selector(firstOK(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.FYbtn.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20)
        ])
        systemBtn(Hview: Hview, Btn: self.FNbtn, title: "아니오, 신청하지 않겠습니다.")
        self.FNbtn.addTarget(self, action: #selector(close(_ :)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.FNbtn.topAnchor.constraint(equalTo: self.FYbtn.bottomAnchor, constant: 5)
        ])
        
        
        Rview.alpha = 0
        animateView(view: Rview, time: 1)
        
        Rview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(Rview)
        NSLayoutConstraint.activate([
            Rview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            Rview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 140)
        ])
    }
    
    //MARK: 첫 번째 응답
    func fristA(){
        let Rview = UIView()
        let Hview = UIView()
        let title = UILabel()
        
        UserView(Rview: Rview, Hview: Hview, title: title, Ment: "네, 신청하겠습니다.")
        
        Rview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(Rview)
        NSLayoutConstraint.activate([
            Rview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            Rview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 30)
        ])
        Rview.alpha = 0
        animateView(view: Rview, time: 0.4)
        
    }
    
    //MARK: 두 번째 질문
    func secondQ(){
        let SRview = UIView()
        let SHview = UIView()
        let title = UILabel()
        let info = UILabel()
        
        systemView(Rview: SRview, Hview: SHview, Ment: "신청하시는 분의 정보를 확인해주세요.", title: title)
        
        info.text = "이름: 이윤수\n성별: 남\n생년월일: 2001.04.17\n전화번호: 010-1111-1111"
        info.numberOfLines = .max
        info.font = UIFont.systemFont(ofSize: 14)
        info.textColor = UIColor(red: 0.549, green: 0.549, blue: 0.549, alpha: 1.0)
        info.translatesAutoresizingMaskIntoConstraints = false
        SHview.addSubview(info)
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            info.leadingAnchor.constraint(equalTo: title.leadingAnchor)
        ])
        
        systemBtn(Hview: SHview, Btn: self.SYbtn, title: "네, 맞습니다.")
        self.SYbtn.addTarget(self, action: #selector(secondOK(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.SYbtn.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 20)
        ])
        systemBtn(Hview: SHview, Btn: self.SNbtn, title: "아니오, 다릅니다.")
        self.SNbtn.addTarget(self, action: #selector(infoEdit(_ :)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.SNbtn.topAnchor.constraint(equalTo: self.SYbtn.bottomAnchor, constant: 5)
        ])
        
        SRview.alpha = 0
        animateView(view: SRview, time: 1)
        
        SRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(SRview)
        NSLayoutConstraint.activate([
            SRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            SRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 215)
        ])
        
        
    }
    
    //MARK: 두 번째 응답
    func secondA(){
        let SRview = UIView()
        let SHview = UIView()
        let title = UILabel()
        
        UserView(Rview: SRview, Hview: SHview, title: title, Ment: "네, 맞습니다.")
        
        SRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(SRview)
        NSLayoutConstraint.activate([
            SRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            SRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 30)
        ])
        SRview.alpha = 0
        animateView(view: SRview, time: 0.4)
    }
    
    //MARK: 세 번째 질문
    func TrQ(){
        let TRview = UIView()
        let THview = UIView()
        let title = UILabel()
        
        let toolbar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:100))
        let Stoolbar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:100))
        
        systemView(Rview: TRview, Hview: THview, Ment: "현재 거주 중이신 지역을 선택해주세요.", title: title)
        
        
        tfSet(tf: self.tf, picker: self.picker, view: THview)
        self.tf.placeholder = "도시를 선택하세요."
        self.picker.tag = 1
        self.tf.inputAccessoryView = toolbar
        
        let btn = UIBarButtonItem(title: "선택완료", style: .done, target: self, action: #selector(pickerDone))
        toolbarSet(toolbar: toolbar, btn: btn)
        
        NSLayoutConstraint.activate([
            self.tf.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            self.tf.widthAnchor.constraint(equalTo: THview.widthAnchor, multiplier: 0.455),
            self.tf.leadingAnchor.constraint(equalTo: THview.leadingAnchor, constant: 10)
        ])
        
        
        tfSet(tf: self.Stf, picker: Spicker, view: THview)
        self.Stf.placeholder = "시/군/구를 선택하세요."
        self.Spicker.tag = 2
        self.Stf.inputAccessoryView = Stoolbar
        self.Stf.alpha = 0.4
        self.Stf.isEnabled = false
        
        let Sbtn = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(SpickerDone(_:)))
        toolbarSet(toolbar: Stoolbar, btn: Sbtn)
        
        NSLayoutConstraint.activate([
            self.Stf.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            self.Stf.widthAnchor.constraint(equalTo: THview.widthAnchor, multiplier: 0.455),
            self.Stf.trailingAnchor.constraint(equalTo: THview.trailingAnchor, constant: -10)
        ])
        
        
        TRview.addSubview(THview)
        
        systemBtn(Hview: THview, Btn: self.Tbtn, title: "선택완료")
        self.Tbtn.addTarget(self, action: #selector(TrOK(_:)), for: .touchUpInside)
        self.Tbtn.alpha = 0.4
        self.Tbtn.isEnabled = false
        NSLayoutConstraint.activate([
            self.Tbtn.topAnchor.constraint(equalTo: tf.bottomAnchor, constant: 5)
        ])
        
        TRview.alpha = 0
        animateView(view: TRview, time: 1)
        
        TRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(TRview)
        NSLayoutConstraint.activate([
            TRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            TRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 140)
        ])
    }
    
    //MARK: 세 번째 응답
    func TrA(){
        let TRview = UIView()
        let THview = UIView()
        let title = UILabel()
        
        UserView(Rview: TRview, Hview: THview, title: title, Ment: (self.citySR)+" "+(self.sigunguSR))
        
        TRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(TRview)
        NSLayoutConstraint.activate([
            TRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            TRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 30)
        ])
        TRview.alpha = 0
        animateView(view: TRview, time: 0.4)
        
        
    }
    
    //MARK: 네 번째 질문(콜센터 미사용)
    func FoQ(){
        let FRview = UIView()
        let FHview = UIView()
        let title = UILabel()
        let picker = UIPickerView()
        let FoToolbar = UIToolbar(frame:CGRect(x:0, y:0, width:100, height:100))
        
        systemView(Rview: FRview, Hview: FHview, Ment: "접수하실 실시기관을 선택해주세요.", title: title)
        
        tfSet(tf: self.Fotf, picker: picker, view: FHview)
        self.Fotf.placeholder = "실시기관을 선택하세요."
        picker.tag = 3
        self.Fotf.inputAccessoryView = FoToolbar
        
        let btn = UIBarButtonItem(title: "선택완료", style: .done, target: self, action: #selector(TpickerDone))
        toolbarSet(toolbar: FoToolbar, btn: btn)
        
        NSLayoutConstraint.activate([
            self.Fotf.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            self.Fotf.widthAnchor.constraint(equalTo: FHview.widthAnchor, multiplier: 0.95),
            self.Fotf.centerXAnchor.constraint(equalTo: FHview.centerXAnchor)
        ])
        
        systemBtn(Hview: FHview, Btn: self.Fobtn, title: "확인")
        self.Fobtn.addTarget(self, action: #selector(FoOK(_:)), for: .touchUpInside)
        self.Fobtn.alpha = 0.4
        self.Fobtn.isEnabled = false
        
        NSLayoutConstraint.activate([
            self.Fobtn.topAnchor.constraint(equalTo: Fotf.bottomAnchor, constant: 5)
        ])
        
        FRview.alpha = 0
        animateView(view: FRview, time: 1)
        
        FRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(FRview)
        NSLayoutConstraint.activate([
            FRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            FRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 140)
        ])
    }
    
    func FoA(){
        let FRview = UIView()
        let FHview = UIView()
        let title = UILabel()
        
        UserView(Rview: FRview, Hview: FHview, title: title, Ment: self.seleHo)
        
        FRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(FRview)
        NSLayoutConstraint.activate([
            FRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            FRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 30)
        ])
        FRview.alpha = 0
        animateView(view: FRview, time: 0.4)
    }
    
    //MARK: 다섯 번째 질문 (개인정보 동의)
    func fiQ(){
        let FIRview = UIView()
        let FIHview = UIView()
        let title = UILabel()
        
        
        systemView(Rview: FIRview, Hview: FIHview, Ment: "개인정보 이용/활용 동의를 확인해주세요.", title: title)
        
        systemBtn(Hview: FIHview, Btn: self.FIbtn, title: "확인 페이지로 이동")
        self.FIbtn.addTarget(self, action: #selector(PIcheck(sender:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.FIbtn.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20)
        ])
        
        FIRview.alpha = 0
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 1
        animateView(view: FIRview, time: 1)
        
        FIRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(FIRview)
        NSLayoutConstraint.activate([
            FIRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            FIRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 90)
        ])
        
        
    }
    
    //MARK: 다섯 번째 응답
    func fiA(){
        let FiRview = UIView()
        let FiHview = UIView()
        let title = UILabel()
        
        UserView(Rview: FiRview, Hview: FiHview, title: title, Ment: "동의 완료")
        
        FiRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(FiRview)
        NSLayoutConstraint.activate([
            FiRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            FiRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 30)
        ])
        FiRview.alpha = 0
        animateView(view: FiRview, time: 0.4)
    }
    
    //MARK: 신청 완료
    func finish(){
        let FinRview = UIView()
        let FinHview = UIView()
        let title = UILabel()
        let explanation = UILabel()
        
        systemView(Rview: FinRview, Hview: FinHview, Ment: "접수가 완료되었습니다.", title: title)
        
        if self.data.isCall{
            explanation.text = "임상시험 자세한 안내를 위해 1주일 이내에 올리브씨에서 연락드릴 예정입니다.\n올리브씨를 이용해주셔서 감사합니다."
        }else{
            explanation.text = "임상시험 자세한 안내를 위해 2주일 이내에 실시기관에서 연락드릴 예정입니다.\n올리브씨를 이용해주셔서 감사합니다."
        }
       
        
        explanation.numberOfLines = 3
        explanation.lineBreakMode = .byCharWrapping
        explanation.adjustsFontSizeToFitWidth = true
        explanation.font = UIFont.systemFont(ofSize: 14)
        explanation.textColor = UIColor(hue: 0, saturation: 0, brightness: 0.34, alpha: 1.0)
        explanation.translatesAutoresizingMaskIntoConstraints = false
        FinHview.addSubview(explanation)
        NSLayoutConstraint.activate([
            explanation.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            explanation.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            explanation.trailingAnchor.constraint(equalTo: FinHview.trailingAnchor, constant: -10)
        ])
        
        systemBtn(Hview: FinHview, Btn: self.Finbtn, title: "확인")
        self.Finbtn.addTarget(self, action: #selector(AcOk(_:)), for: .touchUpInside)
        NSLayoutConstraint.activate([
            self.Finbtn.topAnchor.constraint(equalTo: explanation.bottomAnchor, constant: 20)
        ])
        
        FinRview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(FinRview)
        NSLayoutConstraint.activate([
            FinRview.widthAnchor.constraint(equalTo: self.stackView.widthAnchor),
            FinRview.heightAnchor.constraint(equalTo: title.heightAnchor, constant: 150)
        ])
        
    }
    
    @objc func firstOK(_ sender:Any){
        fristA()
        animateBtn(Ybtn: self.FYbtn, Nbtn: self.FNbtn)
        secondQ()
        
        print("1")
        print(self.scrollView.contentSize.height)
        print(self.scrollView.bounds.size.height)
        if self.scrollView.bounds.size.height < 500{
            self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + 330), animated: true)
        }
    }
    
    @objc func close(_ sender:Any){
        self.alert = UIAlertController(title: "신청을 취소하시겠습니까?", message: nil, preferredStyle: .actionSheet)
        self.alert.addAction(UIAlertAction(title: "네", style: .default){ _ in
            self.dismiss(animated: true)
        })
        self.alert.addAction(UIAlertAction(title: "아니오", style: .cancel))
        self.present(self.alert, animated: true)
    }
    
    @objc func secondOK(_ sender:Any){
        secondA()
        animateBtn(Ybtn: self.SYbtn, Nbtn: self.SNbtn)
        TrQ()
        print("2")
        print(self.scrollView.contentSize.height)
        print(self.scrollView.bounds.size.height)
        self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + 250), animated: true)
        
    }
    
    @objc func TrOK(_ sender:Any){
        TrA()
            UIView.animate(withDuration: 0.2, animations: {
                self.Tbtn.isEnabled = false
                self.Tbtn.alpha = 0.4
                self.tf.isEnabled = false
                self.tf.alpha = 0.4
                self.Stf.isEnabled = false
                self.Stf.alpha = 0.4
            })
        
        if !self.data.isCall {
            FoQ()
            self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + 250), animated: true)
        }else{
            fiQ()
            self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + 200), animated: true)
        }
        
        print("3")
        print(self.scrollView.contentSize.height)
        print(self.scrollView.bounds.size.height)
        
    }
    
    @objc func FoOK(_ sender:Any){
        FoA()
        UIView.animate(withDuration: 0.2, animations: {
            self.Fobtn.isEnabled = false
            self.Fobtn.alpha = 0.4
            self.Fotf.isEnabled = false
            self.Fotf.alpha = 0.4
        })
        fiQ()
        
        self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + 200), animated: true)
    }
    
    
    @objc func infoEdit(_ sender:Any){
        //alert 필요
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        if kCount{
            let userInfo:NSDictionary = sender.userInfo! as NSDictionary
            let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            keyHeight = keyboardHeight
            
            self.view.frame.size.height -= keyboardHeight
            self.kCount = false
        }
    }
    
    @objc func keyboardWillHide(_ sender: Notification) {
        self.view.frame.size.height += keyHeight
        self.kCount = true
    }
    
    @objc func pickerDone(_ sender:Any){
        self.view.endEditing(true)
        self.Stf.isEnabled = true
        self.Spicker.selectRow(0, inComponent: 0, animated: true)
        self.Stf.text = self.sigungu[self.citySR]![0]
        self.sigunguSR = self.sigungu[self.citySR]![0]
        self.Tbtn.alpha = 1
        self.Tbtn.isEnabled = true
        self.Stf.alpha = 1
    }
    
    @objc func SpickerDone(_ sender:Any){
        self.view.endEditing(true)
    }
    
    @objc func TpickerDone(_ sender:Any){
         self.view.endEditing(true)
    }
    
    @objc func PIcheck(sender:UISwitch){
        let pivc = PIViewController()
        pivc.fiaDelegate = self
        pivc.margin = self.margin
        self.present(pivc, animated: true)
    }
    
    @objc func AcOk(_ sender:Any){
        self.dismiss(animated: true)
    }
}

extension ApplicationViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            
            return self.city.count
        }else if pickerView.tag == 2{
            return self.sigungu[self.citySR]!.count
        }else{
            self.hospital = self.data.hospital.components(separatedBy: ",")
            return hospital.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            self.citySR = city[0]
            self.tf.text = city[0]
            return self.city[row]
            
        }else if pickerView.tag == 2{
            self.Stf.text = self.sigungu[self.citySR]![0]
            self.sigunguSR = self.sigungu[self.citySR]![0]
            return self.sigungu[self.citySR]![row]
            
        }else{
            self.Fotf.text = self.hospital[0]
            self.seleHo = self.hospital[0]
            self.Fobtn.alpha = 1
            self.Fobtn.isEnabled = true
            return self.hospital[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            self.tf.text = self.city[row]
            self.citySR = self.city[row]
            self.Stf.text = ""
            
        }else if pickerView.tag == 2{
            self.Stf.text = self.sigungu[self.citySR]![row]
            self.sigunguSR = self.sigungu[self.citySR]![row]
        
        }else{
            self.Fotf.text = self.hospital[row]
            self.seleHo = self.hospital[row]
        }
    }
}
extension ApplicationViewController:fiaDelegate{
    func fiaData(c1:String, c2:String){
        self.check1 = c1
        self.check2 = c2
        self.FIbtn.isEnabled = false
        self.FIbtn.alpha = 0.4
        self.scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + 250), animated: true)
        fiA()
        self.closeBtn.isHidden = true
        finish()
    }
}
