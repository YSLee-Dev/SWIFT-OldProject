//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by 이윤수 on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTitleInput()
    }
    
    func initTitle(){
        // 1. 내비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // 2. 속성 설정
        nTitle.numberOfLines = 2
        nTitle.textAlignment = .center
        nTitle.font = UIFont.systemFont(ofSize: 15)
        nTitle.textColor = .white
        nTitle.text = "50개의 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        // 배경 색 설정
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        
        // 3. 내비게이션 타이틀에 입력
        self.navigationItem.titleView = nTitle
    }
    
    func initTitleNew(){
        // 1. 복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame: CGRect(x: 0, y:0, width: 200, height: 36))
        
        // 2. 상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = .white
        topTitle.text = "50개의 숙소"
        
        // 3. 하단 레이블 정의
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = .white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        // 4.상하단 레이블을 컨테이너 뷰에 추가한다.
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        // 5. 내비게이션 타이틀에 컨테이너 뷰를 대입한다.
        self.navigationItem.titleView = containerView
        
        // 배경 색
        self.navigationController?.navigationBar.barTintColor = UIColor.black
    }
    
    func initTitleImage(){
        let image = UIImage(named:"swift_logo")
        let imageV = UIImageView(image:image)
        
        self.navigationItem.titleView = imageV
    }
    
    func initTitleInput(){
        // 1. 텍스트 필드 객체 생성
        let tf = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 35))
        tf.backgroundColor = .white
        tf.font = UIFont.systemFont(ofSize: 13)
        tf.autocorrectionType = .no // 자동입력 X
        tf.autocapitalizationType = .none // 자동 대문자 X
        tf.spellCheckingType = .no // 스펠링 체크
        tf.keyboardType = .URL // URL 입력 키보드
        tf.layer.borderWidth = 1 // border
        tf.layer.borderColor = UIColor.gray.cgColor
        
        self.navigationItem.titleView = tf
        
        // let v = UIView()
        // v.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
        // v.backgroundColor = .brown
        
        let back = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        
        // let leftItem = UIBarButtonItem(customView: v)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        // rv.backgroundColor = .red
        
        // step 2
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        // 외각선
        cnt.layer.borderWidth = 2
        cnt.layer.cornerRadius = 3
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        cnt.isUserInteractionEnabled = true
        cnt.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(touch(_:))))
    
        rv.addSubview(cnt)
        
        // step 3
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        
        rv.addSubview(more)
        
        let rightItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rightItem
        
    }
    @objc func touch(_ sender:Any){
        print("a")
    }
}

