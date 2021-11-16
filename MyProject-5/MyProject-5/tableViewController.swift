//
//  tableViewController.swift
//  MyProject-5
//
//  Created by 이윤수 on 2020/11/26.
//

import UIKit

class tableViewController:UITableViewController{
    
    var list = [String]()
    
    func alert(Ctitle:String ,Cmsg:String, Atitle:String){
        let at = UIAlertController(title: Ctitle, message: Cmsg, preferredStyle: .alert)
        
        at.addAction(UIAlertAction(title: Atitle, style: .default))
        
        self.present(at, animated: true)
    }
    
    @IBAction func plus(_ sender: Any) {
        let tfalert = UIAlertController(title: "TODO", message: "TODO CREATE", preferredStyle: .alert)
        tfalert.addAction(UIAlertAction(title: "OK", style: .default){(_)in
            if let value = tfalert.textFields?[0].text{
                self.list.append(value)
                self.tableView.reloadData()
            }else{
                self.alert(Ctitle: "NO VALUE", Cmsg: "VALUE INERT", Atitle: "OK")
            }
        })
        tfalert.addTextField()
        self.present(tfalert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "icell") as? tableCell
        cell?.label.text = self.list[indexPath.row]
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ins = self.storyboard?.instantiateViewController(identifier: "detail") as? detail
        
        ins?.label = self.list[indexPath.row]
        
        self.navigationController?.pushViewController(ins!, animated: true)
    }
}
