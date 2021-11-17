//
//  PIViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/06/17.
//

import UIKit

protocol fiaDelegate {
    func fiaData(c1:String, c2:String)
}

class PIViewController: UIViewController {
    
    var fiaDelegate:fiaDelegate?

    var green = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
    var gray = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0)
    var margin:CGFloat!
    
    let stackView = UIStackView()
    let scrollView = UIScrollView()
    let allCheckT = UILabel()
    let allCheckS = UISwitch()
    let okBtn = UIButton(type: .custom)
    var border:UIView!
    var Mtitle:UILabel!
    
    let Fof = UISwitch()
    let Sof = UISwitch()
    var check1:String = "미동의"
    var check2:String = "미동의"
    
    func di(Mview:UIView, Mtitle:String, Stitle:String, of:UISwitch){
        let title = UILabel()
        let scview = UIScrollView()
        let stview = UIStackView()
        let dt = UILabel()
        
        title.text = Mtitle
        title.adjustsFontSizeToFitWidth = true
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.translatesAutoresizingMaskIntoConstraints = false
        Mview.addSubview(title)
        
        of.translatesAutoresizingMaskIntoConstraints = false
        of.onTintColor = self.green
        Mview.addSubview(of)
        
        dt.text = Stitle
        dt.numberOfLines = .max
        dt.font = UIFont.systemFont(ofSize: 13)
        dt.translatesAutoresizingMaskIntoConstraints = false
        stview.addArrangedSubview(dt)
        
        stview.alignment = .fill
        stview.distribution = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        
        scview.addSubview(stview)
        
        scview.backgroundColor = self.gray
        scview.layer.masksToBounds = true
        scview.layer.cornerRadius = 10
        scview.translatesAutoresizingMaskIntoConstraints = false
        Mview.addSubview(scview)
        
        Mview.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(Mview)
        
        NSLayoutConstraint.activate([
            Mview.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -(self.margin*2)),
            Mview.heightAnchor.constraint(equalToConstant: 150),
            Mview.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: self.margin),
            Mview.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -self.margin),
            
            title.leadingAnchor.constraint(equalTo: Mview.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: of.leadingAnchor, constant: -5),
            title.topAnchor.constraint(equalTo: Mview.topAnchor, constant: 5),

            
            of.trailingAnchor.constraint(equalTo: Mview.trailingAnchor),
            of.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            
            scview.widthAnchor.constraint(equalTo: Mview.widthAnchor),
            scview.heightAnchor.constraint(equalToConstant: 100),
            scview.leadingAnchor.constraint(equalTo: Mview.leadingAnchor),
            scview.trailingAnchor.constraint(equalTo: Mview.trailingAnchor),
            scview.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 15),
            
            stview.widthAnchor.constraint(equalTo: scview.widthAnchor, constant: -20),
            stview.topAnchor.constraint(equalTo: scview.topAnchor, constant: 15),
            stview.bottomAnchor.constraint(equalTo: scview.bottomAnchor, constant: -20),
            stview.leadingAnchor.constraint(equalTo: scview.leadingAnchor, constant: 10),
            stview.trailingAnchor.constraint(equalTo: scview.trailingAnchor, constant: -10),

            dt.centerXAnchor.constraint(equalTo: stview.centerXAnchor)
            
        ])
    }
    
    override func viewDidLoad() {

        self.view.backgroundColor = .white
        
        //MARK: 취소 버튼
        let closeBtn = UIButton()
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
        self.Mtitle.text = "개인정보 이용/활용 동의"
        self.Mtitle.font = UIFont.boldSystemFont(ofSize: 27)
        self.Mtitle.translatesAutoresizingMaskIntoConstraints = false
        self.Mtitle.adjustsFontSizeToFitWidth = true
        self.view.addSubview(self.Mtitle)
        
        NSLayoutConstraint.activate([
            self.Mtitle.topAnchor.constraint(equalTo: closeBtn.bottomAnchor, constant: 20),
            self.Mtitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: self.margin)
        ])
        
        //MARK: 전체 동의
        self.allCheckT.text = "전체 동의"
        self.allCheckT.adjustsFontSizeToFitWidth = true
        self.allCheckT.font = UIFont.boldSystemFont(ofSize: 17)
        self.allCheckT.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.allCheckT)
        
        self.allCheckS.translatesAutoresizingMaskIntoConstraints = false
        self.allCheckS.onTintColor = self.green
        self.allCheckS.addTarget(self, action: #selector(allCheck(sender:)), for: .valueChanged)
        self.view.addSubview(self.allCheckS)
        
        NSLayoutConstraint.activate([
            self.allCheckT.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.margin),
            self.allCheckT.topAnchor.constraint(equalTo: Mtitle.bottomAnchor, constant: 20),
            self.allCheckS.centerYAnchor.constraint(equalTo: self.allCheckT.centerYAnchor),
            self.allCheckS.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -self.margin)
        ])
        
        self.scrollView.alwaysBounceVertical = true
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.scrollView)
        NSLayoutConstraint.activate([
            self.scrollView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.allCheckS.bottomAnchor, constant: 20),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        self.stackView.alignment = .center
        self.stackView.axis = .vertical
        self.stackView.distribution = .fill
        self.stackView.spacing = 25
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(self.stackView)
        NSLayoutConstraint.activate([
            self.stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -10),
            self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        self.okBtn.setTitle("확인", for: .normal)
        self.okBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.okBtn.setTitleColor(UIColor.white, for: .normal)
        self.okBtn.isEnabled = false
        self.okBtn.backgroundColor = self.gray
        self.okBtn.layer.masksToBounds = false
        self.okBtn.layer.cornerRadius = 10
        self.okBtn.addTarget(self, action: #selector(checkOk(_:)), for: .touchUpInside)
        self.okBtn.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.okBtn)
        NSLayoutConstraint.activate([
            self.okBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: (-self.margin*2)),
            self.okBtn.heightAnchor.constraint(equalToConstant: 50),
            self.okBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.okBtn.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
        ])
        
        conllection()
        TPofferings()
    }
    
    func conllection(){
        let Fview = UIView()
        let Ftitle = "1. 제공받는 자: 올리브헬스케어\n2. 개인정보 수집항목\n성명, 성별, 생년월일, 거주지역, 휴대폰번호, 관심질환\n3. 개인정보 수집 및 이용목적\n- 임상시험 신청 시 임상시험 실시기관에 연계하기 위해\n- 마케팅에 활용 : 신규 서비스(임상시험정보 포함) 및 이벤트 정보 제공, 이벤트 경품 제공/배송, 행사 진행, 새로운 이벤트 및 임상시험정보 안내 (이메일, 전화, DM/SMS 발송),인구통계학적 특성에 따른 서비스 제공 및 광고게재를 위한 이용자별 통계분석자료 활용\n- 이용자관리 : 리서치, 서비스에 대한 만족도 조사, DM/SMS 발송, 임상시험 관련 안내, 다양한 이용자관리 프로그램 진행\n4. 개인정보의 보유 및 이용기간\n- 개인정보의 보유 및 이용은 동의일로부터 3년까지 이용 목적을 위하여 보유 및 이용됩니다. 종료일 이후 당사 리스크관리 업무를 위하여 보유 및 이용됩니다.\n- 이용자의 요청에 따라 개인정보 사용에 대한 동의를 철회할 때까지의 기간 (안내 및 철회기간을 고려하여 1개월 보존후 파기)"
        self.Fof.addTarget(self, action: #selector(Onconllection(sender:)), for: .valueChanged)
        di(Mview: Fview, Mtitle: "개인정보의 수집 및 이용(필수)", Stitle: Ftitle, of: self.Fof)
        
    }
    
    func TPofferings(){
        let Sview = UIView()
        let Stitle = "1. 제공받는 자\n이용자가 지원한 임상시험 실시기관\n2. 개인정보 제공 항목\n성명, 성별, 생년월일, 거주지역, 휴대폰번호, 질환정보, 복용약 등(임상연구에 따라 다름)\n3. 개인정보 이용 목적\n임상시험 참여 시 선정/제외기준 확인, 참여일정 안내\n4. 개인정보의 보유 및 이용기간 제공 동의일로부터 개인정보의 제공 목적을 달성할 때까지"
        self.Sof.addTarget(self, action: #selector(OnTPofferings(sender:)), for: .valueChanged)
        di(Mview: Sview, Mtitle: "개인정보의 제3자 제공 및 활용(필수)", Stitle: Stitle, of: self.Sof)
    }
    
    @objc func close(_ sender:Any){
        self.dismiss(animated: true)
    }
    
    @objc func checkOk(_ sender:Any){
        
        self.dismiss(animated: true){
            self.fiaDelegate?.fiaData(c1:self.check1, c2:self.check2)
        }
    }
    
    @objc func allCheck(sender:UISwitch){
        if sender.isOn{
            self.Fof.isOn = true
            self.Sof.isOn = true
            self.okBtn.backgroundColor = self.green
            self.okBtn.isEnabled = true
            self.check1 = "동의"
            self.check2 = "동의"
        }else{
            self.Fof.isOn = false
            self.Sof.isOn = false
            self.okBtn.backgroundColor = self.gray
            self.okBtn.isEnabled = false
            self.check1 = "미동의"
            self.check2 = "미동의"
        }
    }
    
    @objc func Onconllection(sender:UISwitch){
        if sender.isOn{
            if self.Sof.isOn{
                self.okBtn.backgroundColor = self.green
                self.okBtn.isEnabled = true
                print(okBtn.isEnabled,"성공")
                self.check1 = "동의"
            }else{
                self.okBtn.backgroundColor = self.gray
                self.okBtn.isEnabled = false
            }
        }else{
            self.okBtn.backgroundColor = self.gray
            self.okBtn.isEnabled = false
            self.allCheckS.isOn = false
            self.check1 = "미동의"
        }
    }
    
    @objc func OnTPofferings(sender:UISwitch){
        if sender.isOn{
            if self.Fof.isOn{
                self.okBtn.backgroundColor = self.green
                self.okBtn.isEnabled = true
                print(okBtn.isEnabled,"성공")
            }else{
                self.okBtn.backgroundColor = self.gray
                self.okBtn.isEnabled = false
            }
        }else{
            self.okBtn.backgroundColor = self.gray
            self.okBtn.isEnabled = false
            self.allCheckS.isOn = false
            self.check2 = "미동의"
        }
    }
}
