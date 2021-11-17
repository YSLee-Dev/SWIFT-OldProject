//
//  detail.swift
//  MyProject-5
//
//  Created by 이윤수 on 2020/11/26.
//

import UIKit

class detail:UIViewController, UITextFieldDelegate{
    var label:String?
    var check:Bool?
    @IBOutlet weak var exp: UILabel!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        self.tf.text = self.label
        self.title = self.label
        exp.isHidden = true
        saveBtn.isHidden = true
        
        self.tf.delegate = self
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        exp.isHidden = false
        saveBtn.isHidden = false
        exp.text = "Press the Save button to save the value."
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        exp.text = "It has been saved."
    }
    @IBAction func saveBtnEnd(_ sender: Any) {
        self.tf.resignFirstResponder()
    }
}

