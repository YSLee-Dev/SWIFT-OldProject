//
//  MemoFormVC.swift
//  MyMemory
//
//  Created by 이윤수 on 2020/12/02.
//

import UIKit

class MemoFormVC: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview: UIImageView!
    var subject:String!
    
    override func viewDidLoad() {
        self.contents.delegate = self
    }
    
    
    @IBAction func save(_ sender: Any) {
        // 내용을 입력하지 않은경우 alert
        guard self.contents.text?.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        // MemoData 객체를 생성하고, 데이터를 담는다.
        let data = MemoData()
        
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date() // 작성시간
        
        // 앱 델리게이트 객체를 읽어온 다음, memolist 배열에 MemoData 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memolist.append(data)
        
        // 작성폼 화면을 종료하고, 이전 화면으로 돌아간다.
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 인스턴스를 생성한다.
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        let alert = UIAlertController(title: "이미지를 가져올 곳을 선택하세요.", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "카메라", style: .default){(_)in
            picker.sourceType = .camera
            // 이미지 피커 화면을 표시한다.
            self.present(picker, animated: true)
        })
        alert.addAction(UIAlertAction(title: "카메라 롤", style: .default){(_)in
            picker.sourceType = .savedPhotosAlbum
            // 이미지 피커 화면을 표시한다.
            self.present(picker, animated: true)
        })
        
        self.present(alert, animated: true)
        
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 선택된 이미지를 미리보기에 출력한다.
        self.preview.image = info[.editedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫는다.
        picker.dismiss(animated: true)
    }

    // 사용자가 텍스트 뷰에 입력하면 자동으로 이 메소드가 실행된다.
    func textViewDidChange(_ textView: UITextView) {
        // 최대 15자리까지 읽어 subject 변ㄴ수에 저장한다.
        let contents = textView.text as NSString
        let length = ((contents.length > 15) ? 15 : contents.length)
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        self.title = self.subject
    }
    
}
