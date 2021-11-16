//
//  ViewController.swift
//  IBTEST
//
//  Created by 이윤수 on 2020/10/19.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "버튼1 눌림"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "버튼2 눌림"
    }
    
    @IBAction func clickBtn03(_ sender: Any){
        self.uiTitle03.text = "버튼3 눌림"
    }
    
    @IBAction func clickBtn04(_ sender: Any){
        self.uiTitle04.text = "버튼4 눌림"
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "버튼5 눌림"
    }
    
}

