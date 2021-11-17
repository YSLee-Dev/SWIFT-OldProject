//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 이윤수 on 2020/11/16.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    
    @IBOutlet var wv: WKWebView!
    var url_s:String!
    var title_s:String!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        // 네비게이션 타이틀 변경
        self.title = title_s
        
        // URLRequest 인스턴스를 생성한다.
        let url = URL(string: url_s)
        let req = URLRequest(url: url!)
        
        // WKNavigationDelegate의 델리게이트 지정
        self.wv.navigationDelegate = self
        
        self.wv.load(req)
        
    }
}
// MARK:- WKNavigationDelegate 프로토콜 구현
extension DetailViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating() // 인디케이터 뷰의 애니메이션을 실행
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중단
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중단
        
        // 경고창 형식으로 오류 메세지를 표시
        let alert = UIAlertController(title: "오류", message: "상세페이지를 읽어오지 못했습니다.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "확인", style: .cancel){(_)in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController{
    // 구현안됨
}
