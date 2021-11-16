//
//  CSButton.swift
//  MyProject - 9
//
//  Created by 이윤수 on 2021/04/26.
//

import UIKit

class CSButton:UIButton{
    
    var cgray:UIColor = UIColor(red: 0.298, green: 0.298, blue: 0.298, alpha: 1.0)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
        
    init() {
        super.init(frame:CGRect.zero)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.setTitleColor(self.cgray, for: .normal)
        self.layer.borderColor = self.cgray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 13
    }
}
