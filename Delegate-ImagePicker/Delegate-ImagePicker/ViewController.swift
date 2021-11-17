//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 이윤수 on 2020/10/29.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var imgView: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        
        // 이미지 피커 컨트롤러 인스턴스 생성
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary // 이미지 소스로 사진 라이브러리 선택
        picker.allowsEditing = true // 이미지 편집 기능
        
        // 델리게이트 지정
        picker.delegate = self
        
        // 이미지 피커 컨트롤러 실행
        self.present(picker, animated: true)
    
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지 피커에서 이미지를 선택하지 않고 취소했을 때 호출되는 메소드
        
        // 이미지 피커 컨트롤 창 닫기
        picker.dismiss(animated: true){ () in
            
            // 알림창 호출
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다,", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            
            self.present(alert, animated: true)
        }
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 이미지 피커에서 이미지를 선택했을 때 호출되는 메소드
        
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: true)
        
        // 이미지를 이미지 뷰에 표시
        let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        self.imgView.image = img
    }
    
}

