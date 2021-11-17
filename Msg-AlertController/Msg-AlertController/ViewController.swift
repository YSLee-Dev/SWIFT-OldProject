//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by 이윤수 on 2020/10/26.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        // 화면이 뜨자마자 alert이 실행되어야 할 때
    }

    @IBOutlet var result: UILabel!
    
    @IBAction func alert(_ sender: Any) {
        
        // 메세지 창 객체 생성
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel){(_)in
            self.result.text = "취소버튼을 클릭했습니다."
        }
        let ok = UIAlertAction(title: "확인", style: .default){(_)in
            self.result.text = "확인버튼을 클릭했습니다."
        }
        let exec = UIAlertAction(title: "실행", style: .destructive){(_)in
            self.result.text = "실행버튼을 클릭했습니다."
        }
        let stop = UIAlertAction(title: "중지", style: .default){(_)in
             self.result.text = "중지버튼을 클릭했습니다."
        }
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 메세지 창 실행
        self.present(alert, animated: true)
        
    }
    
    @IBAction func login(_ sender: Any) {
         // 메세지 창 객체 생성
        let alert = UIAlertController(title: "로그인", message: "사용자의 Apple ID abc@abc.com에 대한 암호를 입력하십시오.", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "로그인", style: .default){(_) in
            // 확인버튼을 클릭했을 때 내용 처리
            if let tf = alert.textFields?[0]{
                print("입력된 값은 \(tf.text)입니다.")
            }else{
                print("입력된 값이 없습니다.")
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 텍스트 필트 추가
        alert.addTextField(configurationHandler: {(tf)in
            // 텍스트 필드의 속성설정
            tf.placeholder="암호" // placeholder
            tf.isSecureTextEntry = true // 비밀번호 처리
        })
        
        self.present(alert, animated: true)
    }
    
    @IBAction func auth(_ sender: Any) {
         // 메세지 창 객체 생성
        let alert = UIAlertController(title: nil, message: "로그인", preferredStyle: .alert)
        
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){(_)in
            // 확인 버튼을 클릭했을 때 실행할 내용
            
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if(loginId=="abc"&&loginPw=="1234"){
                self.result.text = "\(loginId)님 환영합니다."
            }else{
                self.result.text = "인증에 실패하였습니다."
            }
        }
        alert.addAction(cancle)
        alert.addAction(ok)
        
        // 아이디 필드 추가
        alert.addTextField(configurationHandler: {(tf)in
            tf.placeholder = "아이디" //placeholder
            tf.isSecureTextEntry = false // 입력 시 별표처리 안함
        })
        
        // 비밀번호 필드 추가
        alert.addTextField(configurationHandler: {(tf)in
            tf.placeholder = "비밀번호" //placeholder
            tf.isSecureTextEntry = true // 입력 시 별표처리
        })
        self.present(alert, animated: true)
    }
    
}

