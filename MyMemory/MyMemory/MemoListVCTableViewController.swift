//
//  MemoListVCTableViewController.swift
//  MyMemory
//
//  Created by 이윤수 on 2020/12/02.
//

import UIKit

class MemoListVCTableViewController: UITableViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memolist.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // memolist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
        let row = appDelegate.memolist[indexPath.row]
        
        // 이미지 속성이 비어있을 경우 "memoCell" 아니면 "memoCellWithImage"
        let cellId = row.image == nil ? "memoCell" : "memoCellWithImage"
        
        // 재사용 큐로부터 프로토타입 셀의 인스턴스를 전달받는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId )as? MemoCell
        
        // memoCell 의 내용을 구성한다.
        cell?.subject.text = row.title
        cell?.contents.text = row.contents
        cell?.img?.image = row.image
        
        // Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포맷에 맞게 변경한다.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell?.regdate.text = formatter.string(from: row.regdate!)
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = self.appDelegate.memolist[indexPath.row]
        
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MemoRead")as? MemoReadVC else {
            return
        }
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
