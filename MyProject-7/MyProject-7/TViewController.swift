//
//  TViewController.swift
//  MyProject-7
//
//  Created by 이윤수 on 2020/12/22.
//

import UIKit

class TViewController: UIViewController {

    var testBtn:UIButton!
    var ud = UserDefaults.standard
    var img_v:UIImageView!
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        print("aaa")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if ud.string(forKey: "certified") == "1"{
            self.testBtn = UIButton(type: .system)
            self.testBtn.frame = CGRect(x: 0, y: 100, width: 10, height: 20)
            self.testBtn.setTitle("로그아웃", for: .normal)
            self.testBtn.sizeToFit()
            self.testBtn.center.x = self.view.frame.width/2
            self.testBtn.addTarget(self, action: #selector(logout(_:)) , for: .touchUpInside)
            self.view.addSubview(testBtn)
            
            let img = UIImage(data: ud.data(forKey: "faceImg")!)
            self.img_v = UIImageView(image: img)
            print(img)
            
            self.img_v.frame = CGRect(x: 0, y: 150, width: 200, height: 200)
            self.img_v.center.x = self.view.frame.width/2
            self.view.addSubview(img_v)
            
        }else{
            self.testBtn = UIButton(type: .system)
            self.testBtn.frame = CGRect(x: 0, y: 100, width: 10, height: 20)
            self.testBtn.setTitle("로그인되지 않음", for: .normal)
            self.testBtn.sizeToFit()
            self.testBtn.center.x = self.view.frame.width/2
            self.view.addSubview(testBtn)
            self.img_v = UIImageView()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.testBtn.removeFromSuperview()
        self.img_v.removeFromSuperview()
    }
    
    @objc func logout(_ sender:Any){
        
        alert = UIAlertController(title: "로그아웃을 하시려면 본인얼굴을 등록하세요.", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "네", style: .default){_ in
            let img = UIImagePickerController()
            img.allowsEditing = false
            img.sourceType = .photoLibrary
            img.delegate = self
            self.present(img, animated: true)
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        self.present(alert, animated: true)
        
        
        
    }

}

extension TViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        self.dismiss(animated: true)
        
        alert = UIAlertController(title: "등록된 얼굴은 얼굴 매칭을 위해 서버에 저장됩니다.😱", message: "로그인한 얼굴과 로그아웃한 얼굴이 다를 경우 로그인이 제한될 수 있습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "동의함", style: .default){_ in
            self.ud.setValue(nil, forKey: "certified")
            self.ud.setValue(nil, forKey: "name")
            
            self.dismiss(animated: true)
        })
        alert.addAction(UIAlertAction(title: "동의하지 않음", style: .cancel))
        self.present(alert, animated: true)
        
        
        
    }
}
