//
//  TableViewController.swift
//  MyProject-3
//
//  Created by 이윤수 on 2020/11/09.
//

import UIKit

class TableViewController:UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBAction func click(_ sender: Any) {
        let alert = UIAlertController(title: "친구 추가", message: "친구 사진 및 이름을 입력하십시오.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "추가", style: .default){(_)in
            let ad = UIApplication.shared.delegate as? AppDelegate
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.allowsEditing = false
            ad?.title = alert.textFields?[0].text
            
            picker.delegate = self
            self.present(picker, animated: true)
        
        }
        alert.addTextField(){(tf)in
            tf.placeholder = "친구의 이름을 입력하십시오."
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
        
        let alert = UIAlertController(title:"친구 추가가 취소되었습니다." , message: "버튼을 눌러 다시 시도하세요.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(ok)
        
        self.present(alert, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        picker.dismiss(animated: true)
        
        let img = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        ad?.img_add = img
        
        self.tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tv = tableView.dequeueReusableCell(withIdentifier: "TableView") as? PrototypeController
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        tv?.img.image = ad?.img_add
        tv?.title.text = ad?.title
        
        tableView.rowHeight = 80
        
        return tv!
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
}


