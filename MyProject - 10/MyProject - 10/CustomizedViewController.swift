//
//  CustomizedViewController.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/07/12.
//

import UIKit

class CustomizedViewController: UIViewController {

    var green = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
    var gray = UIColor(red: 0.9373, green: 0.9373, blue: 0.9373, alpha: 1.0)
    let multiplier:CGFloat = 0.93
    var margin:CGFloat!
    var cornerRadius:CGFloat = 12
    
    var Mtitle:UILabel!
    var scrollView:UIScrollView!
    var stackView:UIStackView!
    var filterView_title:UILabel!
    
    var gender:String!
    var old:Int!
    var area:[String]!
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "맞춤임상"
        self.margin = (self.navigationController?.systemMinimumLayoutMargins.leading)!*2
        
        // 초기값
        self.gender = "남"
        self.old = 0
        
        filter()
    }
    
    // MARK: 메인 맞춤 필터
    func filter(){
        let filterView = UIButton()
        self.filterView_title = UILabel()
        let filterView_arrow = UILabel()
        
        // 타이틀
        self.filterView_title.text = "성별: "+self.gender+"\n나이: "+String(self.old)+"\n지역: 없음\n질환: 없음"
        self.filterView_title.font = UIFont.boldSystemFont(ofSize: 16)
        self.filterView_title.numberOfLines = 6
        self.filterView_title.adjustsFontSizeToFitWidth = true
        self.filterView_title.textColor = .white
        self.filterView_title.translatesAutoresizingMaskIntoConstraints = false
        filterView.addSubview(self.filterView_title)
        NSLayoutConstraint.activate([
            self.filterView_title.centerYAnchor.constraint(equalTo: filterView.centerYAnchor),
            self.filterView_title.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: 15)
        ])
        
        // 화살표
        filterView_arrow.text = ">"
        filterView_arrow.font = UIFont.systemFont(ofSize: 20)
        filterView_arrow.textColor = .white
        filterView_arrow.translatesAutoresizingMaskIntoConstraints = false
        filterView.addSubview(filterView_arrow)
        NSLayoutConstraint.activate([
            filterView_arrow.centerYAnchor.constraint(equalTo: filterView.centerYAnchor),
            filterView_arrow.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: -25)
        ])
        
        // View(button)
        filterView.backgroundColor = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
        filterView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
        filterView.layer.masksToBounds = false
        filterView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
        filterView.layer.shadowRadius = 3
        filterView.layer.shadowOpacity = 0.15
        filterView.layer.cornerRadius = self.cornerRadius
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.addTarget(self, action: #selector(cvsMove(_:)), for: .touchUpInside)
        self.view.addSubview(filterView)
        NSLayoutConstraint.activate([
            filterView.heightAnchor.constraint(equalToConstant: 100),
            filterView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -self.margin),
            filterView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            filterView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func cvsMove(_ sender:Any){
        let csv = CVSettingViewController()
        csv.cvsDelegate = self
        csv.genderC = self.gender
        csv.oldC = self.old
        csv.margin = self.margin/2
        self.present(csv, animated: true)
    }
}

extension CustomizedViewController:cvs{
    func cvdata(gender: String, old:Int) {
        self.gender = gender
        self.old = old
        filterView_title.text = "성별: "+self.gender+"\n나이: "+String(self.old)+"\n관심지역: 없음\n관심질환: 없음"
    }
}
