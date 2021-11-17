//
//  ViewController.swift
//  MyProject-1
//
//  Created by 이윤수 on 2020/10/27.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        people.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
    
    @IBOutlet var time: UIDatePicker!
    @IBOutlet var contents: UITextField!
    @IBOutlet var people: UITextField!
    @IBOutlet var time2: UIDatePicker!
    @IBOutlet var today: UILabel!
    
    var Sdate:String = "無い"
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let pvc = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else{
            return
        }
        
        // datePick 사용 시 formatter 변경 필요함
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        Sdate = dateformatter.string(from: time.date)
        
        let msg = "予約時間：\(Sdate)"
        let alert = UIAlertController(title: "情報をチェックしてください.", message: msg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "キャンセル", style: .cancel)
        let ok = UIAlertAction(title: "はい", style: .destructive){(_)in
            
            pvc.resultTime = self.Sdate
            pvc.resultContents = self.contents.text
            pvc.resultPeople = self.people.text
            pvc.resulttime2 = self.time2.date
            
            self.navigationController?.pushViewController(pvc, animated: true)
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true)
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.count)! + string.count > 2{
            return false
        }else{
            return true
        }
    }
}



