//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by 이윤수 on 2020/12/08.
//

import UIKit

class ViewController: UIViewController {

    // 직접 메소드를 만들어 이벤트를 연결해줘야한다.
    @objc func btnOnClick(_ sender:Any){
        // 호출한 객체가 버튼이라면
        if let btn = sender as? UIButton{
            btn.setTitle("클릭됨", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 객체를 만들고, 속성을 설정한다.
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: .normal)
        
        // 버튼을 수평 중앙 정렬한다.
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y:100)
        
        // 루트 뷰에 버튼을 추가한다.
        self.view.addSubview(btn)
        
        // 버튼의 이벤트와 메소드 btnOnClick(_:)을 연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_:)), for: .touchUpInside)
    }


}

