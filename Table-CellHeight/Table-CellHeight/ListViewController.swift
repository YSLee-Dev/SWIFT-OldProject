//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 이윤수 on 2020/11/05.
//

import UIKit

class ListViewController:UITableViewController{
    
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "목록입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        alert.addTextField(){ (tf)in
            tf.placeholder = "입력하세요."
        }
        
        let ok = UIAlertAction(title: "확인", style: .default){(_)in
            // 알림창의 0번째에 입력필드에 값이 있다면
            if let title = alert.textFields?[0].text{
                // 배열에 입력된 값을 추가하고 테이블 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell이란 아이디를 가진 셀을 읽어온다. 없으면 UITableViewCell 인스턴스를 생성한다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        cell.textLabel?.numberOfLines = 0
        
        // 자동 사이즈 조절
        self.tableView.estimatedRowHeight = 50 // 대충 높이 값
        self.tableView.rowHeight = UITableView.automaticDimension
        
        // 셀의 기본 텍스트를 레이블에 배열 변수의 값을 할당한다.
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    /* 수동 사이즈 조절
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = self.list[indexPath.row]
        
        // 높이를 조절해준다. 기본 높이 60 + 글의 길이가 30자를 넘어갈 때마다 20만큼 높이를 늘려준다.
        let height = CGFloat(60+(row.count/30)*20)
        return height
    }
    */
}

