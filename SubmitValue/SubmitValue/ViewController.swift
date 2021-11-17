//
//  ViewController.swift
//  SubmitValue
//
//  Created by 이윤수 on 2020/10/22.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // 1. 전달할 값 준비
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!
    
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if(sender.isOn == true){
            self.isUpdateText.text = "갱신함"
        }else{
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        
        self.intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
        // 3. vc2의 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else{
            // ResultViewController로 다운캐스팅 해서 받는다.
            // instantiateViewController를 통해 받는 타입은
            // UIViewController 인데, 우리가 참조해야하는 프로퍼티는
            // ResultViewController에 있기 때문에, 다운캐스팅(as)를 해서 받는다
            // as? - nui 값이 올 수도 있음
            return
        }
        // 4. 값 전달하는 과정
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        // 화면이동
       //  self.present(rvc,animated: true) 아래는 세그웨이 이용
        self.navigationController?.pushViewController(rvc, animated:true)
    }
    
   
    // 세그웨이 방법
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "MaunalSubmit", sender: self)
    }
    
    // 세그웨이를 이용해 값 전달
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // 목적지 뷰 컨트롤러 인스턴스 읽어오기
           let dest = segue.description
           
           guard let rvc = dest as? ResultViewController else{
               return
           }
           
           // 값 전달
           rvc.paramEmail = self.email.text!
           rvc.paramUpdate = self.isUpdate.isOn
           rvc.paramInterval = self.interval.value
           
       }
}

