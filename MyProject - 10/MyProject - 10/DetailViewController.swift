//
//  DetailViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/05/20.
//

import UIKit

class DetailViewController: UIViewController {

    var scrollView:UIScrollView!
    var stackView:UIStackView!
    
    var green = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
    var gray = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0)
    var margin:CGFloat!
    
    var selectRow = 0
    var data:ct!
    let loginCheck = UserDefaults.standard
    var alert:UIAlertController!
    var backBtn:UIButton!
    var applicationUI:UIButton!
    var headerView:UIView!
    var headerTitle:UILabel!
    
    func infoAuto(info:UIStackView,TV:String, Value:String){
       
        let View = UIView()
        let Tlabel = UILabel()
        let label = UILabel()
        
        Tlabel.text = TV
        Tlabel.font = UIFont.boldSystemFont(ofSize: 18)
        Tlabel.translatesAutoresizingMaskIntoConstraints = false
        View.addSubview(Tlabel)
        NSLayoutConstraint.activate([
            Tlabel.topAnchor.constraint(equalTo: View.topAnchor, constant: 15),
            Tlabel.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant: 15)
        ])
        
        label.numberOfLines = .max
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.2392, green: 0.2392, blue: 0.2392, alpha: 1.0)
        label.lineBreakMode = .byCharWrapping
        label.text = Value
        View.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: Tlabel.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: View.trailingAnchor, constant: -15)
        ])
        
        View.translatesAutoresizingMaskIntoConstraints = false
        info.addArrangedSubview(View)
        NSLayoutConstraint.activate([
            View.widthAnchor.constraint(equalTo: info.widthAnchor),
            View.heightAnchor.constraint(equalTo: label.heightAnchor, constant: 60)
        ])
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.margin = (self.navigationController?.systemMinimumLayoutMargins.leading)!*2
        
        let CTDdata = CTD()
        self.data = CTDdata.ct_data[selectRow]
        
        let URBtn = UIButton(type: .custom)
        URBtn.addTarget(self, action: #selector(application(_:)), for: .touchUpInside)
        URBtn.setTitle("신청하기", for: .normal)
        URBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        URBtn.setTitleColor(UIColor.white, for: .normal)
        URBtn.backgroundColor = self.green
        URBtn.layer.masksToBounds = false
        URBtn.layer.cornerRadius = 10
        URBtn.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: URBtn)
        NSLayoutConstraint.activate([
            URBtn.widthAnchor.constraint(equalToConstant: 70),
            URBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // 네비게이션이 숨겨져있을 때도 제스처 동작 가능하게 구문
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
        //MARK: 스크롤 뷰 부분
        self.scrollView = UIScrollView()
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.delegate = self
        self.scrollView.backgroundColor = .white
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.scrollView)
        NSLayoutConstraint.activate([
            self.scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        //MARK: 스택 뷰 부분
        self.stackView = UIStackView()
        self.stackView.backgroundColor = self.gray
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.alignment = .center
        self.stackView.spacing = 5
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
        ])
        
       
        topInfo()
        info()
        application()
        callCenter()
        blank(height: 70, color: self.gray, at: 3)
        header()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //MARK: 네비게이션 부분
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    //MARK: 상단 이미지 부분
    func header(){
        self.headerView = UIView()
        self.backBtn = UIButton(type: .custom)
        self.headerTitle = UILabel()
        
        // 뒤로가기 버튼
        self.backBtn.setImage(UIImage(named: "backIcon.png"), for: .normal)
        self.backBtn.translatesAutoresizingMaskIntoConstraints = false
        self.backBtn.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
        self.headerView.addSubview(self.backBtn)
        NSLayoutConstraint.activate([
            self.backBtn.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 10),
            self.backBtn.centerYAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -22),
            self.backBtn.widthAnchor.constraint(equalToConstant: 30),
            self.backBtn.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // 타이틀
        self.headerTitle.text = self.data.Stitle
        self.headerTitle.font = UIFont.boldSystemFont(ofSize: 15)
        self.headerTitle.textColor = .black
        self.headerTitle.textAlignment = .center
        self.headerTitle.alpha = 0
        self.headerTitle.translatesAutoresizingMaskIntoConstraints = false
        self.headerView.addSubview(self.headerTitle)
        NSLayoutConstraint.activate([
            self.headerTitle.widthAnchor.constraint(equalTo: self.headerView.widthAnchor, multiplier: 0.7),
            self.headerTitle.centerXAnchor.constraint(equalTo: self.headerView.centerXAnchor),
            self.headerTitle.centerYAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: -22),
        ])
        
        self.headerView.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 0)
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.headerView)
        NSLayoutConstraint.activate([
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 44)
                
        ])
    }
    
    //MARK: 상단 정보 부분
    func topInfo(){
        let topView = UIView()
        let logo = UIImageView()
        let titleView = UIView()
        let titleLabel = UILabel()
        
        logo.image = UIImage(named: data.HMI)
        logo.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(logo)
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalTo: topView.widthAnchor, constant: -self.margin),
            logo.heightAnchor.constraint(equalTo: logo.widthAnchor, multiplier: 0.23),
            logo.topAnchor.constraint(equalTo: topView.topAnchor),
            logo.centerXAnchor.constraint(equalTo: topView.centerXAnchor)
            
        ])
        
        titleView.backgroundColor = self.green
        titleView.layer.masksToBounds = false
        titleView.layer.cornerRadius = 10
        titleView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        titleView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        titleView.layer.shadowRadius = 3
        titleView.layer.shadowOpacity = 0.15
        titleView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.widthAnchor.constraint(equalTo: topView.widthAnchor, constant: -self.margin),
            titleView.heightAnchor.constraint(equalTo: logo.heightAnchor, multiplier: 0.6),
            titleView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            titleView.topAnchor.constraint(equalTo: logo.bottomAnchor)
        ])
        
        titleLabel.text = data.Stitle
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: titleView.widthAnchor, multiplier: 0.95),
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
        ])
        
        topView.backgroundColor = .white
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(topView)
        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            topView.heightAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.39)
        ])
    }
   
    //MARK: 정보 부분
    func info(){
        let info = UIStackView()
        
        info.alignment = .fill
        info.axis = .vertical
        info.distribution = .fill
        info.spacing = 15
        info.translatesAutoresizingMaskIntoConstraints = false
        
        // 임상시험 이름
        infoAuto(info: info, TV: "임상시험 명칭", Value: data.Stitle)
        // 임상시험 목적
        infoAuto( info: info, TV: "임상시험 목적", Value: data.purpose)
        // 임상시험 방법
        infoAuto(info: info, TV: "임상시험 방법", Value: data.rule)
        // 대상자 자격 요건
        infoAuto(info: info, TV: "대상자 자격 요건", Value: data.people)
        // 예측가능한 부작용
        infoAuto(info: info, TV: "예측가능한 부작용", Value: data.SideEffects)
        // 예측가능한 부작용
        infoAuto(info: info, TV: "임상시험대상자 제공사항", Value: data.CTdate)
        
        info.backgroundColor = .white
        info.layer.masksToBounds = false
        info.layer.cornerRadius = 10
        info.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(info)
        NSLayoutConstraint.activate([
            info.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    // MARK: 콜센터 부분
    func callCenter(){
        let callCenterView = UIView()
        let callListLebel = UILabel()
        let arrow = UILabel()
        
        callListLebel.translatesAutoresizingMaskIntoConstraints = false
        callListLebel.text = "실시/의뢰기관"
        callListLebel.font = UIFont.boldSystemFont(ofSize: 17)
        callCenterView.addSubview(callListLebel)
        NSLayoutConstraint.activate([
            callListLebel.centerYAnchor.constraint(equalTo: callCenterView.centerYAnchor),
            callListLebel.leadingAnchor.constraint(equalTo: callCenterView.leadingAnchor, constant: 15)
        ])
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.text = ">"
        arrow.font = UIFont.boldSystemFont(ofSize: 17)
        callCenterView.addSubview(arrow)
        NSLayoutConstraint.activate([
            arrow.centerYAnchor.constraint(equalTo: callCenterView.centerYAnchor),
            arrow.trailingAnchor.constraint(equalTo: callCenterView.trailingAnchor, constant: -30)
        ])
        
        callCenterView.translatesAutoresizingMaskIntoConstraints = false
        callCenterView.backgroundColor = .white
        callCenterView.layer.masksToBounds = false
        callCenterView.layer.cornerRadius = 10
        self.stackView.addArrangedSubview(callCenterView)
        NSLayoutConstraint.activate([
            callCenterView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin),
            callCenterView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    //MARK: 신청, 전화부분
    func application(){
        let appView = UIView()
        self.applicationUI = UIButton(type: .custom)
        let callUI = UIButton(type: .custom)
        
        self.applicationUI.addTarget(self, action: #selector(application(_:)), for: .touchUpInside)
        self.applicationUI.setTitle("신청하기", for: .normal)
        self.applicationUI.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.applicationUI.setTitleColor(UIColor.white, for: .normal)
        self.applicationUI.backgroundColor = self.green
        self.applicationUI.layer.masksToBounds = false
        self.applicationUI.layer.cornerRadius = 10
        self.applicationUI.translatesAutoresizingMaskIntoConstraints = false
        appView.addSubview(self.applicationUI)
        NSLayoutConstraint.activate([
            self.applicationUI.widthAnchor.constraint(equalTo: appView.widthAnchor, multiplier: 0.7, constant: (-self.margin/2)-5),
            self.applicationUI.heightAnchor.constraint(equalToConstant: 45),
            self.applicationUI.centerYAnchor.constraint(equalTo: appView.topAnchor, constant: 35),
            self.applicationUI.trailingAnchor.constraint(equalTo: appView.trailingAnchor, constant: (-self.margin/2))
        ])
        
        callUI.setTitle("전화문의", for: .normal)
        callUI.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        callUI.setTitleColor(UIColor.black, for: .normal)
        callUI.backgroundColor = .white
        callUI.layer.masksToBounds = false
        callUI.layer.borderWidth = 1.5
        callUI.layer.borderColor = self.gray.cgColor
        callUI.layer.cornerRadius = 10
        callUI.translatesAutoresizingMaskIntoConstraints = false
        appView.addSubview(callUI)
        NSLayoutConstraint.activate([
            callUI.widthAnchor.constraint(equalTo: appView.widthAnchor, multiplier: 0.3, constant: -self.margin/2),
            callUI.heightAnchor.constraint(equalToConstant: 45),
            callUI.centerYAnchor.constraint(equalTo: appView.topAnchor, constant: 35),
            callUI.leadingAnchor.constraint(equalTo: appView.leadingAnchor, constant: (self.margin/2) )
        ])
        
        appView.backgroundColor = .white
        appView.layer.masksToBounds = false
        appView.layer.cornerRadius = 10
        appView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        appView.layer.masksToBounds = false
        appView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        appView.layer.shadowRadius = 3
        appView.layer.shadowOpacity = 0.15
        appView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(appView)
        NSLayoutConstraint.activate([
            appView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            appView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            appView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            appView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
    }
    
    //MARK: 여백
    func blank(height:CGFloat, color: UIColor, at: Int){
        let blankView = UIView()
        blankView.backgroundColor = color
        blankView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.insertArrangedSubview(blankView, at: at)
        NSLayoutConstraint.activate([
            blankView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -self.margin),
            blankView.heightAnchor.constraint(equalToConstant: height),
        ])
    }
    
    @objc func application(_ sender:Any){
        
        if loginCheck.string(forKey: "loginOK") == "1" {
            let av = ApplicationViewController()
            av.isModalInPresentation = true
            av.margin = self.margin/2
            av.selectRow = self.selectRow
            self.present(av, animated: true)
        }else{
            self.alert = UIAlertController(title: "신청하시려면 로그인을 해주세요.", message: "1분 안에 회원가입이 가능해요!", preferredStyle: .alert)
            self.alert.addAction(UIAlertAction(title: "로그인 하기", style: .default){_ in
                let stv = UINavigationController(rootViewController: SettingViewController())
                stv.modalPresentationStyle = .pageSheet
                stv.isModalInPresentation = true
                self.present(stv, animated: true)
            })
            self.alert.addAction(UIAlertAction(title: "나중에 신청", style: .cancel))
            self.present(self.alert, animated: true)
        }
    }
    
    @objc func back(_ sender:Any){
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 50 {
            UIView.animate(withDuration: 0.25, animations: {
                self.headerView.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 1.0)
                self.headerTitle.alpha = 1
            })
        }else{
            UIView.animate(withDuration: 0.25, animations: {
                self.headerView.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 1, alpha: 0)
                self.headerTitle.alpha = 0
            })
        }
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
