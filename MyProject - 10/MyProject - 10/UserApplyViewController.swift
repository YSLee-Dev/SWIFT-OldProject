//
//  UserApplyViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/06/29.
//

import UIKit

class UserApplyViewController: UIViewController {

    var green = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
    var gray = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0)
    let multiplier:CGFloat = 0.93
    var margin:CGFloat!
    
    var border:UIView!
    var Mtitle:UILabel!
    
    override func viewDidLoad() {
        //MARK: 네비게이션 부분
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = self.green
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.title = "자원자 모집"
        self.margin = (self.navigationController?.systemMinimumLayoutMargins.leading)!
    
    }

}
