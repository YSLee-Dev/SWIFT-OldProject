//
//  ViewController.swift
//  Chapter03-TabBar
//
//  Created by 이윤수 on 2020/12/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        // title 레이블 생성
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        // title 레이블 속성 설정
        title.text = "첫 번째 탭"
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14) // 폰트는 시스템 폰트, 14pt
        
        title.sizeToFit() // 콘텐츠 내용에 맞게 레이블 크기 변경
        
        title.center.x = self.view.frame.width/2 // x축의 중앙에 오도록
        
        self.view.addSubview(title)
        
        // self.tabBarItem.image = UIImage(named: "calendar.png") // 탭 바에 커스텀 이미지를 등록한다.
        // self.tabBarItem.title = "Calendar" // 탭 이름을 등록한다.
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabbar = self.tabBarController?.tabBar
        // tabbar?.isHidden = (tabbar?.isHidden == true) ? false : true
        
        UIView.animate(withDuration: TimeInterval(0.15)){
            // alpha 값이 0이면 1로, 1이면 0으로 바꾸어준다.
            // 호출될 때 마다 점점 투명해졌다가 점점 진해진다.
            tabbar?.alpha = (tabbar?.alpha == 0 ? 1:0)
        }
    }
}

