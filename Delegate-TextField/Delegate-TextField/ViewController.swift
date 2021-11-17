//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by 이윤수 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var tf: UITextField!
    @IBOutlet var ifOn: UISwitch!
    
    override func viewDidLoad() {
        
        // 텍스트 필드 속성 설정
        self.tf.placeholder = "값을 입력하세요." // placeholder
        self.tf.keyboardType = UIKeyboardType.alphabet // 키보드 타입 영문자 패드
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 스타일 다크
        self.tf.returnKeyType = UIReturnKeyType.join // 키보드 리턴키 타입
        self.tf.enablesReturnKeyAutomatically = true // 키보드 리턴키 자동 활성화
        
        // 텍스트 필드 스타일 설정
        self.tf.borderStyle = UITextField.BorderStyle.line // 테두리 스타일 - 직선
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0) // 배경색
        self.tf.contentVerticalAlignment = .center // 수직방향으로 텍스트 가운데 정렬 (열거형 생략)
        self.tf.contentHorizontalAlignment = .center // 수평방향으로 텍스트 가운데 정렬 (열거형 생략)
        self.tf.layer.borderColor = UIColor.darkGray.cgColor // 테두리 색 - 회색
        self.tf.layer.borderWidth = 2.0 // 테두리 두께 - 2.0pt
        
        // 텍스트 필드를 최조 응답자로 지정
        self.tf.becomeFirstResponder()
        
        // 델리게이트 지정
        self.tf.delegate = self
        
    }
    @IBAction func confirm(_ sender: Any) {
        
        // 텍스트 필드를 최초 응답자 객체에서 해제
        self.tf.resignFirstResponder()
    }
    
    @IBAction func input(_ sender: Any) {
        
        // 텍스트 필드를 최초 응답자 객체로 지정
        self.tf.becomeFirstResponder()
    }
    
    // 텍스트 필드의 편집을 시작할 때 호출
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 시작됩니다.")
        return true
       
    }
    
    // 텍스트 필드의 내용이 삭제될 때 호출
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true // false를 리턴하면 삭제되지 않는다.
    }
    
    // 텍스트 필드의 내용이 변경될 때 호출
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 \(string)으로 변경됩니다.")
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true를 리턴
            if (textField.text?.count)! + string.count > 10{
                return false
            }else{
                if (ifOn.isOn == true){
                    return true // false를 리턴하면 편집되지 않는다.
                }else{
                    return false
                }
            }
        }else{
            return false
        }
    }
    
    // 텍스트 필드의 리턴키가 눌러졌을 때 호출
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("텍스트 필드의 리턴키가 눌러졌습니다.")
        return true
    }
    
    // 텍스트 필드 편집이 종료될 떄 호출
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 종료됩니다.")
        return true
    }
    
    // 텍스트 필드의 편집이 종료되었을 때 호출
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
    
}



