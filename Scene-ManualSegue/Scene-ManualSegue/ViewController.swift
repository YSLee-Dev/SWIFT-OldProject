//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by 이윤수 on 2020/10/21.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
}

