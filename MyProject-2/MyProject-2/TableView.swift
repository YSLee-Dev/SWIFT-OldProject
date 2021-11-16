//
//  TableView.swift
//  MyProject-2
//
//  Created by 이윤수 on 2020/11/04.
//

import UIKit

class TableView : UITableViewController{
    
    var list = [DataVo]()
    
    override func viewDidLoad() {
        var mvo = DataVo()
        mvo.model_name = "iPhone12"
        mvo.price = 1090000
        mvo.openYear = 2020
        
        mvo = DataVo()
        mvo.model_name = "iPhone12Pro"
        mvo.price = 1360000
        mvo.openYear = 2020
        
        mvo = DataVo()
        mvo.model_name = "iPhone11"
        mvo.price = 990000
        mvo.openYear = 2019
        
        mvo = DataVo()
        mvo.model_name = "iPhone11Pro"
        mvo.price = 1390000
        mvo.openYear = 2019
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "listView")!
        
        cell.textLabel?.text = "a"
        
        return cell
    }
    
}


