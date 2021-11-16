//
//  ViewController.swift
//  Hello Wolrd
//
//  Created by 이윤수 on 2020/10/19.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var count : Int = 0
    
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "HELLO"
    }
    
}

