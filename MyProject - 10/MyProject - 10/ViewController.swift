//
//  ViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: 선언
    var nav_setting:UIView!
    var scrollView:UIScrollView!
    var stackView:UIStackView!
    let loginCheck = UserDefaults.standard
    var main_myView:UIView!
    var alert:UIAlertController!
    var main_tableView:UITableView!
    let ctd = CTD()
    var Mtitle = UILabel()
    var sv:SettingViewController!
    
    var count = 0
    var cornerRadius:CGFloat = 12
    var margin:CGFloat!
    
    func mainView() -> UIView{
        let M_view = UIView()
        M_view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        M_view.layer.masksToBounds = false
        M_view.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        M_view.layer.shadowRadius = 3
        M_view.layer.shadowOpacity = 0.15
        M_view.layer.cornerRadius = self.cornerRadius
        M_view.translatesAutoresizingMaskIntoConstraints = false
        
        return M_view
    }
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = .white
        
        //MARK: * 네비게이션 바 왼쪽 여백 구하는 코드 *
        self.margin = ((self.navigationController?.systemMinimumLayoutMargins.leading)!*2)
        print(self.navigationController?.systemMinimumLayoutMargins.leading)
        print(self.margin)
        
        
        // MARK: 네비게이션 부분
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        self.navigationItem.largeTitleDisplayMode = .never
                
        self.nav_setting = UIView()
        self.nav_setting.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let setting_icon = UIButton()
        setting_icon.setBackgroundImage(UIImage(named: "setting_icon.png"), for: .normal)
        setting_icon.translatesAutoresizingMaskIntoConstraints = false
        self.nav_setting.addSubview(setting_icon)
        setting_icon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        setting_icon.heightAnchor.constraint(equalToConstant: 25).isActive = true
        setting_icon.addTarget(self, action: #selector(Msetting(_:)), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.nav_setting)
        
        
        // MARK: main 스크롤 뷰 선언
        self.scrollView = UIScrollView()
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.delegate = self
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            self.scrollView.widthAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.widthAnchor),
            self.scrollView.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
        
        // MARK: main 스택뷰 선언
        self.stackView = UIStackView()
        self.stackView.axis = .vertical
        self.stackView.alignment = .center
        self.stackView.distribution = .fill
        self.stackView.spacing = 20
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -20),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        
        if loginCheck.string(forKey: "loginOK") == "1" {
            self.Mtitle.text = "이윤수님\n환영합니다."
        }else{
            self.Mtitle.text = "AllLiveC"
        }
        self.Mtitle.font = UIFont.boldSystemFont(ofSize: 27)
        self.Mtitle.translatesAutoresizingMaskIntoConstraints = false
        self.Mtitle.numberOfLines = 2
        self.Mtitle.adjustsFontSizeToFitWidth = true
        self.stackView.addArrangedSubview(self.Mtitle)
        NSLayoutConstraint.activate([
            self.Mtitle.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
        
       
        
        main_UserPick()
        main_rc()
        main_banner()
        main_news()
        main_list()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if loginCheck.string(forKey: "loginOK") == "1"{
            if self.count == 0{
                main_myView_f()
                self.count = 1
            }
            self.Mtitle.text = "이윤수님\n환영합니다."
        }else{
            main_myView?.removeFromSuperview()
            self.count = 0
            self.Mtitle.text = "AllLiveC"
        }
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: 메인 유료 배너
    func main_banner(){
        let main_banner =  mainView()
        let main_banner_imgView = UIImageView()
        
        main_banner_imgView.image = UIImage(named: "banner1.png")
        main_banner_imgView.clipsToBounds = true
        main_banner_imgView.layer.cornerRadius = self.cornerRadius
        main_banner_imgView.translatesAutoresizingMaskIntoConstraints = false
        main_banner.addSubview(main_banner_imgView)
        NSLayoutConstraint.activate([
            main_banner_imgView.widthAnchor.constraint(equalTo: main_banner.widthAnchor),
            main_banner_imgView.heightAnchor.constraint(equalTo: main_banner.heightAnchor)
        ])
        
        main_banner.layer.borderWidth = 1
        main_banner.layer.borderColor = UIColor(red: 0.9176, green: 0.9176, blue: 0.9176, alpha: 1.0).cgColor
        self.stackView.addArrangedSubview(main_banner)
        NSLayoutConstraint.activate([
            main_banner.heightAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.4),
            main_banner.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    // MARK: 메인 추천시험
    func main_UserPick(){
        let main_UserPick = UIButton()
        let main_UserPick_title = UILabel()
        let main_UserPick_arrow = UILabel()
        
        // 타이틀
        main_UserPick_title.text = "나에게 맞는 임상을 확인해보세요."
        main_UserPick_title.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight(1000))
        main_UserPick_title.textColor = .white
        main_UserPick_title.translatesAutoresizingMaskIntoConstraints = false
        main_UserPick.addSubview(main_UserPick_title)
        NSLayoutConstraint.activate([
            main_UserPick_title.centerYAnchor.constraint(equalTo: main_UserPick.centerYAnchor),
            main_UserPick_title.leadingAnchor.constraint(equalTo: main_UserPick.leadingAnchor, constant: 15)
        ])
        
        // 화살표
        main_UserPick_arrow.text = ">"
        main_UserPick_arrow.font = UIFont.systemFont(ofSize: 20)
        main_UserPick_arrow.textColor = .white
        main_UserPick_arrow.translatesAutoresizingMaskIntoConstraints = false
        main_UserPick.addSubview(main_UserPick_arrow)
        NSLayoutConstraint.activate([
            main_UserPick_arrow.centerYAnchor.constraint(equalTo: main_UserPick.centerYAnchor),
            main_UserPick_arrow.trailingAnchor.constraint(equalTo: main_UserPick.trailingAnchor, constant: -25)
        ])
        
        // View
        main_UserPick.backgroundColor = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
        main_UserPick.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        main_UserPick.layer.masksToBounds = false
        main_UserPick.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        main_UserPick.layer.shadowRadius = 3
        main_UserPick.layer.shadowOpacity = 0.15
        main_UserPick.layer.cornerRadius = self.cornerRadius
        main_UserPick.translatesAutoresizingMaskIntoConstraints = false
        main_UserPick.addTarget(self, action: #selector(cvMove(_:)), for: .touchUpInside)
        self.stackView.addArrangedSubview(main_UserPick)
        NSLayoutConstraint.activate([
            main_UserPick.heightAnchor.constraint(equalToConstant: 60),
            main_UserPick.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    // 맞춤임상으로 이동
    @objc func cvMove(_ sender:Any){
        self.tabBarController?.selectedIndex = 1
    }
    
    // MARK: 메인 마이페이지
    func main_myView_f(){
        self.main_myView = mainView()
        let main_myView_up = UIView()
        let main_myView_down = UIView()
        
        func main_myView_Label() ->UILabel{
            let label = UILabel()
            label.textColor = UIColor(red: 0.1373, green: 0.1373, blue: 0.1373, alpha: 1.0)
            label.font = UIFont.systemFont(ofSize: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }
        let main_myView_label = main_myView_Label()
        let main_myView_btn = UIButton(type: .custom)
        let main_myView_sing = main_myView_Label()
        let main_myView_border = UIView()
        let main_myView_hospital_icon = UIImageView()
        let main_myView_hospital = main_myView_Label()
        let main_myView_call_icon = UIImageView()
        let main_myView_call = main_myView_Label()
        
        // border
        main_myView_border.backgroundColor = UIColor(red: 0.9294, green: 0.9294, blue: 0.9294, alpha: 1.0)
        main_myView_border.translatesAutoresizingMaskIntoConstraints = false
        main_myView.addSubview(main_myView_border)
        NSLayoutConstraint.activate([
            main_myView_border.widthAnchor.constraint(equalTo: main_myView.widthAnchor, multiplier: 0.93),
            main_myView_border.heightAnchor.constraint(equalToConstant: 0.75),
            main_myView_border.centerYAnchor.constraint(equalTo: main_myView.centerYAnchor),
            main_myView_border.centerXAnchor.constraint(equalTo: main_myView.centerXAnchor)
        ])
        
        // upView
        main_myView_up.translatesAutoresizingMaskIntoConstraints = false
        main_myView.addSubview(main_myView_up)
        NSLayoutConstraint.activate([
            main_myView_up.widthAnchor.constraint(equalTo: main_myView.widthAnchor),
            main_myView_up.topAnchor.constraint(equalTo: main_myView.topAnchor, constant: 20),
            main_myView_up.bottomAnchor.constraint(equalTo: main_myView_border.topAnchor, constant: -20),
            main_myView_up.centerXAnchor.constraint(equalTo: main_myView.centerXAnchor),
        ])
        
        // label
        main_myView_label.text = "내가 신청한 임상시험"
        main_myView_label.textColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1.0)
        main_myView_up.addSubview(main_myView_label)
        NSLayoutConstraint.activate([
            main_myView_label.leadingAnchor.constraint(equalTo: main_myView.leadingAnchor, constant:15)
        ])
        
        // btn
        main_myView_btn.setTitle("취소", for: .normal)
        main_myView_btn.layer.borderWidth = 1
        main_myView_btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        main_myView_btn.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.8), for: .normal)
        main_myView_btn.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        main_myView_btn.layer.cornerRadius = 5
        main_myView_btn.translatesAutoresizingMaskIntoConstraints = false
        main_myView_btn.addTarget(self, action: #selector(ctCancel(_:)), for: .touchUpInside)
        main_myView_up.addSubview(main_myView_btn)
        NSLayoutConstraint.activate([
            main_myView_btn.widthAnchor.constraint(equalToConstant: 50),
            main_myView_btn.heightAnchor.constraint(equalToConstant: 30),
            main_myView_btn.trailingAnchor.constraint(equalTo: main_myView.trailingAnchor,constant: -15)
        ])
        
        // label
        main_myView_sing.text = "미간주름 개선 임상시험 대상자 모집"
        main_myView_sing.font = UIFont.boldSystemFont(ofSize: 16)
        main_myView_up.addSubview(main_myView_sing)
        NSLayoutConstraint.activate([
            main_myView_sing.topAnchor.constraint(equalTo: main_myView_label.bottomAnchor, constant: 5),
            main_myView_sing.leadingAnchor.constraint(equalTo: main_myView.leadingAnchor, constant:15),
            main_myView_sing.trailingAnchor.constraint(equalTo: main_myView_btn.leadingAnchor, constant: -10),
            // 버튼 Y center
            main_myView_btn.bottomAnchor.constraint(equalTo: main_myView_sing.bottomAnchor)
        ])
        
        // downView
        main_myView_down.translatesAutoresizingMaskIntoConstraints = false
        main_myView.addSubview(main_myView_down)
        NSLayoutConstraint.activate([
            main_myView_down.widthAnchor.constraint(equalTo: main_myView.widthAnchor),
            main_myView_down.centerXAnchor.constraint(equalTo: main_myView.centerXAnchor),
            main_myView_down.topAnchor.constraint(equalTo: main_myView_border.topAnchor, constant: 20),
            main_myView_down.bottomAnchor.constraint(equalTo: main_myView.bottomAnchor, constant: -20)
        ])
        
        // icon
        main_myView_hospital_icon.image = UIImage(named: "hospital.png")
        main_myView_hospital_icon.translatesAutoresizingMaskIntoConstraints = false
        main_myView_down.addSubview(main_myView_hospital_icon)
        NSLayoutConstraint.activate([
            main_myView_hospital_icon.widthAnchor.constraint(equalToConstant: 16),
            main_myView_hospital_icon.heightAnchor.constraint(equalToConstant: 16),
            main_myView_hospital_icon.leadingAnchor.constraint(equalTo: main_myView.leadingAnchor, constant: 15)
        ])
        
        // label
        main_myView_hospital.text = "서울대학교병원"
        main_myView_down.addSubview(main_myView_hospital)
        NSLayoutConstraint.activate([
            main_myView_hospital.centerYAnchor.constraint(equalTo: main_myView_hospital_icon.centerYAnchor),
            main_myView_hospital.leadingAnchor.constraint(equalTo: main_myView_hospital_icon.leadingAnchor, constant:25),
            main_myView_hospital.trailingAnchor.constraint(equalTo: main_myView.trailingAnchor, constant: -15)
        ])
        
        // icon
        main_myView_call_icon.image = UIImage(named: "call.png")
        main_myView_call_icon.translatesAutoresizingMaskIntoConstraints = false
        main_myView_down.addSubview(main_myView_call_icon)
        NSLayoutConstraint.activate([
            main_myView_call_icon.widthAnchor.constraint(equalToConstant: 16),
            main_myView_call_icon.heightAnchor.constraint(equalToConstant: 16),
            main_myView_call_icon.topAnchor.constraint(equalTo: main_myView_hospital.bottomAnchor, constant: 10),
            main_myView_call_icon.leadingAnchor.constraint(equalTo: main_myView.leadingAnchor, constant: 15)
        ])
        
        // label
        main_myView_call.text = "1111-1111"
        main_myView_down.addSubview(main_myView_call)
        NSLayoutConstraint.activate([
            main_myView_call.centerYAnchor.constraint(equalTo: main_myView_call_icon.centerYAnchor),
            main_myView_call.leadingAnchor.constraint(equalTo: main_myView_call_icon.leadingAnchor, constant:25),
            main_myView_call.trailingAnchor.constraint(equalTo: main_myView.trailingAnchor, constant: -15)
        ])
        
        main_myView.backgroundColor = .white
        self.stackView.insertArrangedSubview(main_myView, at: 1)
        NSLayoutConstraint.activate([
            main_myView.heightAnchor.constraint(equalToConstant: 165),
            main_myView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    // MARK: 메인 3메뉴
    func main_rc(){
        let main_rc = mainView()
    
        func main_rc_label() -> UILabel{
            let main_rc_label = UILabel()
            main_rc_label.font = UIFont.systemFont(ofSize: 13)
            main_rc_label.translatesAutoresizingMaskIntoConstraints = false
            main_rc_label.textColor = UIColor(red: 0.1373, green: 0.1373, blue: 0.1373, alpha: 1.0)
            return main_rc_label
        }
        let main_rc_callIcon = UIButton(type: .custom)
        let main_rc_chat = UIButton(type: .custom)
        let main_rc_health = UIButton(type: .custom)
        let main_rc_callIcon_label = main_rc_label()
        let main_rc_chat_label = main_rc_label()
        let main_rc_health_label = main_rc_label()
        
        // icon
        main_rc_callIcon.setImage(UIImage(named: "rc_call.png"), for: .normal)
        main_rc_callIcon.translatesAutoresizingMaskIntoConstraints = false
        
        main_rc.addSubview(main_rc_callIcon)
        NSLayoutConstraint.activate([
            main_rc_callIcon.widthAnchor.constraint(equalToConstant: 45),
            main_rc_callIcon.heightAnchor.constraint(equalToConstant: 45),
            main_rc_callIcon.topAnchor.constraint(equalTo: main_rc.topAnchor, constant: 20),
            main_rc_callIcon.leadingAnchor.constraint(equalTo: main_rc.leadingAnchor, constant: 40)
        ])
        
        // label
        main_rc_callIcon_label.text = "상담원 연결"
        main_rc.addSubview(main_rc_callIcon_label)
        NSLayoutConstraint.activate([
            main_rc_callIcon_label.topAnchor.constraint(equalTo: main_rc_callIcon.bottomAnchor, constant: 10),
            main_rc_callIcon_label.centerXAnchor.constraint(equalTo: main_rc_callIcon.centerXAnchor),
            main_rc_callIcon_label.bottomAnchor.constraint(equalTo: main_rc.bottomAnchor, constant: -20)
        ])
        
        // icon
        main_rc_chat.setImage(UIImage(named: "rc_chat.png"), for: .normal)
        main_rc_chat.translatesAutoresizingMaskIntoConstraints = false
        main_rc_chat.addTarget(self, action: #selector(chatbotView(_:)), for: .touchUpInside)
        main_rc.addSubview(main_rc_chat)
        NSLayoutConstraint.activate([
            main_rc_chat.widthAnchor.constraint(equalToConstant: 50),
            main_rc_chat.heightAnchor.constraint(equalToConstant: 50),
            main_rc_chat.topAnchor.constraint(equalTo: main_rc.topAnchor, constant: 17),
            main_rc_chat.centerXAnchor.constraint(equalTo: main_rc.centerXAnchor)
        ])
        
        // label
        main_rc_chat_label.text = "챗봇 상담"
        main_rc.addSubview(main_rc_chat_label)
        NSLayoutConstraint.activate([
            main_rc_chat_label.topAnchor.constraint(equalTo: main_rc_chat.bottomAnchor, constant: 10),
            main_rc_chat_label.centerXAnchor.constraint(equalTo: main_rc_chat.centerXAnchor),
            main_rc_chat_label.bottomAnchor.constraint(equalTo: main_rc.bottomAnchor, constant: -20)
        ])
        
        // icon
        main_rc_health.setImage(UIImage(named: "rc_health.jpg"), for: .normal)
        main_rc_health.addTarget(self, action: #selector(UAView(_:)), for: .touchUpInside)
        main_rc_health.translatesAutoresizingMaskIntoConstraints = false
        main_rc.addSubview(main_rc_health)
        NSLayoutConstraint.activate([
            main_rc_health.widthAnchor.constraint(equalToConstant: 45),
            main_rc_health.heightAnchor.constraint(equalToConstant: 45),
            main_rc_health.topAnchor.constraint(equalTo: main_rc.topAnchor, constant: 20),
            main_rc_health.trailingAnchor.constraint(equalTo: main_rc.trailingAnchor, constant: -40)
        ])
        
        // label
        main_rc_health_label.text = "자원자 모집"
        main_rc.addSubview(main_rc_health_label)
        NSLayoutConstraint.activate([
            main_rc_health_label.topAnchor.constraint(equalTo: main_rc_health.bottomAnchor, constant: 10),
            main_rc_health_label.centerXAnchor.constraint(equalTo: main_rc_health.centerXAnchor),
            main_rc_health_label.bottomAnchor.constraint(equalTo: main_rc.bottomAnchor, constant: -20)
        ])
        
        main_rc.backgroundColor = .white
        self.stackView.addArrangedSubview(main_rc)
        NSLayoutConstraint.activate([
            main_rc.heightAnchor.constraint(equalToConstant: 110),
            main_rc.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    // MARK: 챗봇열기
    @objc func chatbotView(_ sender:Any){
        let urlString = URL(string: "https://www.alllivec.co.kr")!
        UIApplication.shared.open(urlString, options: [:], completionHandler: nil)

    }
    
    // MARK: 자원자 모집
    @objc func UAView(_ senrer:Any){
        
        let ua = UserApplyViewController()
        ua.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(ua, animated: true)
    }
    
    // MARK: 메인 뉴스
    func main_news(){
        let main_news = mainView()
        let main_news_view = UIView()
        let main_news_Mtitle = UILabel()
        let main_news_Icon = UIImageView()
        let main_news_Stitle = UILabel()
        
        main_news_view.translatesAutoresizingMaskIntoConstraints = false
        main_news.addSubview(main_news_view)
        NSLayoutConstraint.activate([
            main_news_view.widthAnchor.constraint(equalTo: main_news.widthAnchor, constant: -30),
            main_news_view.heightAnchor.constraint(equalTo: main_news.heightAnchor, constant: -40),
            main_news_view.centerXAnchor.constraint(equalTo: main_news.centerXAnchor),
            main_news_view.centerYAnchor.constraint(equalTo: main_news.centerYAnchor)
        ])
        
        main_news_Icon.image = UIImage(named: "Diabetes.jpg")
        main_news_Icon.translatesAutoresizingMaskIntoConstraints = false
        main_news.addSubview(main_news_Icon)
        NSLayoutConstraint.activate([
            main_news_Icon.widthAnchor.constraint(equalToConstant: 65),
            main_news_Icon.heightAnchor.constraint(equalToConstant: 65),
            main_news_Icon.trailingAnchor.constraint(equalTo: main_news_view.trailingAnchor),
            main_news_Icon.centerYAnchor.constraint(equalTo: main_news.centerYAnchor)
        ])
        
        main_news_Mtitle.text = "AC NEWS"
        main_news_Mtitle.textColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1.0)
        main_news_Mtitle.font = UIFont.systemFont(ofSize: 14)
        main_news_Mtitle.translatesAutoresizingMaskIntoConstraints = false
        main_news_view.addSubview(main_news_Mtitle)
        NSLayoutConstraint.activate([
            main_news_Mtitle.topAnchor.constraint(equalTo: main_news_view.centerYAnchor, constant: -35)
        ])
        
        main_news_Stitle.text = "대학병원교수가 알려주는\n당뇨 관리법!"
        main_news_Stitle.numberOfLines = 2
        main_news_Stitle.font = UIFont.boldSystemFont(ofSize: 17)
        main_news_Stitle.translatesAutoresizingMaskIntoConstraints = false
        main_news_view.addSubview(main_news_Stitle)
        NSLayoutConstraint.activate([
            main_news_Stitle.topAnchor.constraint(equalTo: main_news_Mtitle.bottomAnchor, constant: 10),
            main_news_Stitle.leadingAnchor.constraint(equalTo: main_news_view.leadingAnchor),
            main_news_Stitle.trailingAnchor.constraint(equalTo: main_news_Icon.leadingAnchor, constant: -10)
        ])
        
        main_news.backgroundColor = .white
        self.stackView.addArrangedSubview(main_news)
        NSLayoutConstraint.activate([
            main_news.heightAnchor.constraint(equalToConstant: 110),
            main_news.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    // MARK: 메인 등록현황
    func main_list(){
        let main_list = mainView()
        self.main_tableView = UITableView()
        let main_list_Label = UILabel()
        
        main_list_Label.text = "등록현황"
        main_list_Label.font = UIFont.systemFont(ofSize: 15)
        main_list_Label.textColor = UIColor(red: 0.498, green: 0.498, blue: 0.498, alpha: 1.0)
        main_list_Label.translatesAutoresizingMaskIntoConstraints = false
        main_list.addSubview(main_list_Label)
        NSLayoutConstraint.activate([
            main_list_Label.topAnchor.constraint(equalTo: main_list.topAnchor, constant: 20),
            main_list_Label.leadingAnchor.constraint(equalTo: main_list.leadingAnchor, constant: 15)
        ])
        
        main_tableView.delegate = self
        main_tableView.dataSource = self
        main_tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cellId")
        main_tableView.layer.masksToBounds = false
        main_tableView.separatorInset.left = 0
        main_tableView.separatorStyle = .none
        main_tableView.layer.cornerRadius = cornerRadius
        main_tableView.tableFooterView = UIView()
        main_tableView.translatesAutoresizingMaskIntoConstraints = false
        main_list.addSubview(main_tableView)
        NSLayoutConstraint.activate([
            main_tableView.widthAnchor.constraint(equalTo: main_list.widthAnchor, multiplier: 0.9),
            main_tableView.topAnchor.constraint(equalTo: main_list_Label.bottomAnchor, constant: 10),
            main_tableView.centerXAnchor.constraint(equalTo: main_list.centerXAnchor),
            main_tableView.bottomAnchor.constraint(equalTo: main_list.bottomAnchor)
            
        ])
        
        main_list.backgroundColor = .white
        self.stackView.addArrangedSubview(main_list)
        NSLayoutConstraint.activate([
            main_list.heightAnchor.constraint(equalToConstant: 440),
            main_list.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -self.margin)
        ])
    }
    
    func main_footer(){
        let main_footer = UIView()
        
        main_footer.backgroundColor = UIColor(red: 0.9686, green: 0.9686, blue: 0.9686, alpha: 1.0)
        main_footer.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(main_footer)
        NSLayoutConstraint.activate([
            main_footer.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            main_footer.heightAnchor.constraint(equalToConstant: 100),
            main_footer.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
            
        ])
    }
    
    @objc func Msetting(_ sender:Any){
        
        self.sv = SettingViewController()
        let rvc = UINavigationController(rootViewController: self.sv)
        rvc.modalPresentationStyle = .fullScreen
        
        self.present(rvc, animated: true)
    }
    
    @objc func ctCancel(_ sender:Any){
        
        self.alert = UIAlertController(title: "임상시험 신청을 취소하시겠습니까?", message: "이미 수행기관으로 정보가 이관된 경우 연락이 올 수 있습니다.", preferredStyle: .alert)
        self.alert.addAction(UIAlertAction(title: "네", style: .default) {_ in
            UIView.animate(withDuration: 0.5, animations: {
                self.main_myView.isHidden = true
            })
            self.main_myView.removeFromSuperview()
            print(self.main_myView.isHidden)
            self.count = 0
        })
        self.alert.addAction(UIAlertAction(title: "아니요", style: .cancel))
        
        self.present(self.alert, animated: true)
    }
    
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = main_tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellId, for: indexPath) as! MainTableViewCell
        
        cell.hospital.text = self.ctd.ct_data[indexPath.row].hospital
        cell.mainTitle.text = self.ctd.ct_data[indexPath.row].Stitle
        cell.isOn.text = self.ctd.ct_data[indexPath.row].isOn
        
        cell.selectionStyle = .none
        
        if self.ctd.ct_data[indexPath.row].isOn == "마감"{
            cell.isOn.layer.borderColor = UIColor(hue: 0, saturation: 0.45, brightness: 1, alpha: 1.0).cgColor
            cell.isOn.textColor = UIColor(hue: 0, saturation: 0.45, brightness: 1, alpha: 1.0)
        }
        print(indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.ctd.ct_data[indexPath.row].isOn == "마감"{
            self.alert = UIAlertController(title: "마감된 공고는 열람할 수 없습니다.", message: nil, preferredStyle: .alert)
            self.alert.addAction(UIAlertAction(title: "확인", style: .default))
            self.present(self.alert, animated: true)
            
        }else{
            let dv = DetailViewController()
            dv.hidesBottomBarWhenPushed = true
            dv.selectRow = indexPath.row
            self.navigationController?.pushViewController(dv, animated: true)
        }
        
    }
}

extension ViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= 70{
            self.navigationItem.title = "AllLiveC"
        }else{
            self.navigationItem.title = ""
        }
    }
}
