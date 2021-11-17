//
//  TableViewController.swift
//  Ex_list
//
//  Created by 이윤수 on 2020/11/04.
//

import UIKit

class TableViewController : UITableViewController{
    
    var list = [DataVO]()
    
    override func viewDidLoad() {
        var mvo = DataVO()
        
        mvo.title = "iPhone12"
        mvo.price = "1090000"
        mvo.year = "2020"
        mvo.thumbnail = "iphone12.jpg"
        self.list.append(mvo)
        
        mvo = DataVO()
        mvo.title = "iPhone12Pro"
        mvo.price = "1360000"
        mvo.year = "2020"
        mvo.thumbnail = "iphone12pro.jpg"
        self.list.append(mvo)
        
        mvo = DataVO()
        mvo.title = "iPhone11Pro"
        mvo.price = "1390000"
        mvo.year = "2019"
        mvo.thumbnail = "iphone11pro.jpg"
        self.list.append(mvo)
        
        mvo = DataVO()
        mvo.title = "iPhone11"
        mvo.price = "990000"
        mvo.year = "2019"
        mvo.thumbnail = "iphone11.jpg"
        self.list.append(mvo)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListView") as! PhoneCell
        let row = self.list[indexPath.row]
        
        cell.title?.text = row.title
        cell.openYear?.text = "\(String(row.year!))년"
        cell.price?.text = "\(String(row.price!))원"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
   
}




