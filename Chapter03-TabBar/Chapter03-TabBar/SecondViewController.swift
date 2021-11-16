//
//  SecondViewController.swift
//  Chapter03-TabBar
//
//  Created by 이윤수 on 2020/12/16.
//

import UIKit

class SecondViewController:UIViewController{
    
    override func viewDidLoad() {
        
        // title 레이블 생성
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        
        // title 레이블 속성 설정
        title.text = "두 번째 탭"
        title.textColor = .red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14) // 폰트는 시스템 폰트, 14pt
        
        title.sizeToFit() // 콘텐츠 내용에 맞게 레이블 크기 변경
        
        title.center.x = self.view.frame.width/2 // x축의 중앙에 오도록
        
        self.view.addSubview(title)
        
        // self.tabBarItem.image = UIImage(named: "file-tree.png") // 탭 바에 커스텀 이미지를 등록한다.
        // self.tabBarItem.title = "File" // 탭 이름을 등록한다.
    }
}
