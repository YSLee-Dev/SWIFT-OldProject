//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by 이윤수 on 2020/10/20.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController{
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func back2(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
