//
//  ViewCodeController.swift
//  MyProject-1
//
//  Created by 이윤수 on 2020/10/28.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class ViewCodeController:UIViewController{
    
    var resultCode:String?
    var imgCode:UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var displayCode: UILabel!
    
    override func viewDidLoad() {
        displayCode.text = resultCode
        self.imgView.image = imgCode
    }
 
    @IBAction func onClick(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
