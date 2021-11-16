//
//  secondViewController.swift
//  AppDelegate_ex
//
//  Created by 이윤수 on 2020/10/26.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class secondViewController:UIViewController{
    
    // var paramEmail:String?
    // var paramUpdate:Bool?
    // var paramInterval:Double?
    
    @IBOutlet var email: UILabel!
    @IBOutlet var isUpdate: UILabel!
    @IBOutlet var intervel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        /*
        if let OEmail = paramEmail{
            email.text = OEmail
        }
        if let OisUpdate = paramUpdate{
            isUpdate.text = OisUpdate == true ? "AUTO" : "NOT AUTO"
        }
        if let Ointervel = paramInterval{
            intervel.text = "\(Int(Ointervel))분동안"
        }
 */
        /*
        // AppDelegate 이용
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let OEmail = ad?.paramEmail{
            email.text = OEmail
        }
        if let OisUpdate = ad?.paramUpdate{
            isUpdate.text = OisUpdate == true ? "AUTO" : "NOT AUTO"
        }
        if let Ointervel = ad?.paramInterval{
            intervel.text = "\(Int(Ointervel))분동안"
        }
 */
        let ud = UserDefaults.standard
        
        if let OEmail = ud.string(forKey:"email"){
            email.text = OEmail
        }
        let OisUpdate = ud.bool(forKey:"isUpdate")
        isUpdate.text = OisUpdate == true ? "AUTO" : "NOT AUTO"
        
        let Ointervel = ud.double(forKey: "interval")
        intervel.text = "\(Int(Ointervel))분동안"
        
        
    }
    
}


