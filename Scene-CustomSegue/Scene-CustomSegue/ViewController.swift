//
//  ViewController.swift
//  Scene-CustomSegue
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


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("세그웨이가 곧 실행됩니다. \(segue.identifier!)")
    }
}

