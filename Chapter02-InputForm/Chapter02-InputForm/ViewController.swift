//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by 이윤수 on 2020/12/08.
//

import UIKit

class ViewController: UIViewController {

    var paramEmail: UITextField! // 이메일 입력 필드
    var paramUpdate: UISwitch! // 스위치 객체
    var paramInterval: UIStepper! // 스테퍼
    var txtUpdate:UILabel! // 스위치 컨트롤의 값을 표현할 레이블
    var txtInterval:UILabel! // 스태퍼 컨트롤의 값을 표현한 레이블
    
    
    override func viewDidLoad() {
        
        // 1. 내비게이션 바 타이틀을 입력한다.
        self.title = "설정"
        
        // 2. 이메일 레이블을 생성하고 영역과 기본 문구를 설정한다.
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        // 3. 레이블 폰트를 설정한다.
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        // 4. 레이블을 루트 뷰에 추가한다.
        self.view.addSubview(lblEmail)
        
        // 자동갱신 레이블을 생성하고 루트 뷰에 추가한다.
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblUpdate)
        
        // 갱신주기 레이블을 생성하고 루트 뷰에 추가한다.
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblInterval)
        
        // 이메일 입력을 위한 텍스트 필드를 추가한다.
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = .roundedRect
        self.paramEmail.textAlignment = NSTextAlignment.right
        self.paramEmail.placeholder = "이메일 예) abc@abc.com"
        self.paramEmail.autocapitalizationType = .none
        
        self.view.addSubview(paramEmail)
       
        // 스위치 객체를 생성한다.
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        
        // 스위치가 On 되어 있는 상태를 기본 값으로 설정한다.
        self.paramUpdate.setOn(true, animated: true)
        
        self.view.addSubview(self.paramUpdate)
        
        // 갱신주기를 위한 스태퍼를 추가한다.
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0 // 스태퍼가 가질 수 있는 최소 값
        self.paramInterval.maximumValue = 100 // 스태퍼가 가질 수 있는 최대 값
        self.paramInterval.stepValue = 1 // 스태퍼의 값 변경 단위
        self.paramInterval.value = 0 // 초기 값 설정
        
        self.view.addSubview(self.paramInterval)
        
        // 스위치 객체의 값을 표현할 레이블을 추가한다.
        self.txtUpdate = UILabel()
        
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 200, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red // 텍스트의 색상 설정
        self.txtUpdate.text = "갱신함" // 갱신함 or 갱신하지 않음
        
        self.view.addSubview(txtUpdate)
        
        // 스태퍼의 값을 텍스트로 표현할 레이블을 추가한다.
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        
        self.view.addSubview(self.txtInterval)
        
        // 스위치와 스태퍼 컨트롤의 Value Changed 이벤트를 각각 액션 메소드에 연결한다.
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
    }
    @objc func presentUpdateValue(_ sender:UISwitch){
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    @objc func presentIntervalValue(_ sender:UIStepper){
        self.txtInterval.text = ("\(Int(sender.value))분 마다")
    }
    @objc func submit(_ sender:Any){
          let rvc = ReadViewController()
          
          rvc.pEmail = self.paramEmail.text
          rvc.pUpdate = self.paramUpdate.isOn
          rvc.pInterval = self.paramInterval.value
          
          self.navigationController?.pushViewController(rvc, animated: true)
    }
}

