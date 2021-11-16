//
//  ViewController.swift
//  MyProject - 11
//
//  Created by 이윤수 on 2021/05/10.
//

import UIKit

class ViewController: UIViewController {
        
        let scrollView : UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.alwaysBounceVertical = true
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        let stackView : UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let UIView : UIView = {
           
            let UIView = UIView()
            UIView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor
            UIView.layer.masksToBounds = false
            UIView.layer.shadowOffset = CGSize(width: 0, height: 1.5)
            UIView.layer.shadowRadius = 3
            UIView.layer.shadowOpacity = 0.15
            UIView.backgroundColor = .red
            UIView.translatesAutoresizingMaskIntoConstraints = false
            
            
            
            return UIView
            
        }()

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = .yellow
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationItem.title = "test"
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "테스ㅡㅌ", style: .done, target: self, action: #selector(click(_:)))
            
            
            configureScrollView()
            configureStackView()
            

            testView()
     
        }
        
        private func configureScrollView(){
            view.addSubview(scrollView)
            
            
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
            
        }
        private func configureStackView(){
            scrollView.addSubview(stackView)
            
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
        }
        
        private func testView(){
            stackView.addArrangedSubview(UIView)
            
            NSLayoutConstraint.activate([
                UIView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
                UIView.heightAnchor.constraint(equalTo: stackView.widthAnchor, multiplier: 4)
            ])
        }


    @objc func click(_ sender:Any){
        self.navigationController?.pushViewController(SViewController(), animated: true)
    }


}

