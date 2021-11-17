//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by 이윤수 on 2020/10/21.
//  Copyright © 2020 이윤수. All rights reserved.
//

import UIKit

class NewSegue: UIStoryboardSegue{
    
    override func perform() {
        
        // 세그웨이의 출발지 뷰 컨트롤러
        let srcUVC = self.source
        
        // 세그웨이의 목적지 뷰 컨트롤러
        let destUVC = self.destination
        
        // fromView에서 toView로 뷰를 전환한다.
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
