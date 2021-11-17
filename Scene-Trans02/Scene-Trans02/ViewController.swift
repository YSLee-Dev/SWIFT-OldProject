//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by 이윤수 on 2020/10/20.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{
            return
        }
        self.present(uvc, animated: true)
    }
}

