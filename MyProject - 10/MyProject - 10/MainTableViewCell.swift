//
//  MainTableViewCell.swift
//  MyProject - 10
//
//  Created by 이윤수 on 2021/05/17.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let cellId = "cellId"
    let mainTitle = UILabel()
    let isOn = UILabel()
    let hospital = UILabel()
    let border = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        self.addSubview(mainTitle)
        self.addSubview(isOn)
        self.addSubview(border)
        border.addSubview(hospital)
        
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        isOn.translatesAutoresizingMaskIntoConstraints = false
        hospital.translatesAutoresizingMaskIntoConstraints = false
        border.translatesAutoresizingMaskIntoConstraints = false
        
        isOn.font = UIFont.systemFont(ofSize: 13)
        isOn.layer.masksToBounds = false
        isOn.layer.cornerRadius = 10
        isOn.layer.borderWidth = 1
        isOn.layer.borderColor = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0).cgColor
        isOn.textColor = UIColor(red: 0.4902, green: 0.702, blue: 0.251, alpha: 1.0)
        isOn.textAlignment = .center
        
        mainTitle.font = UIFont.boldSystemFont(ofSize: 14)
        mainTitle.numberOfLines = 2
        mainTitle.lineBreakMode = .byCharWrapping
        
        border.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.96, alpha: 1.0)
        border.layer.masksToBounds = false
        border.layer.cornerRadius = 15
        
        hospital.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            
            border.widthAnchor.constraint(equalTo: self.widthAnchor),
            border.heightAnchor.constraint(equalToConstant: 30),
            border.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            border.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            border.topAnchor.constraint(equalTo: self.isOn.bottomAnchor, constant: 12.5),
            
            isOn.widthAnchor.constraint(equalToConstant: 40),
            isOn.heightAnchor.constraint(equalToConstant: 20),
            isOn.topAnchor.constraint(equalTo: self.topAnchor, constant: 12.5),
            isOn.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            mainTitle.leadingAnchor.constraint(equalTo: isOn.trailingAnchor, constant: 5),
            mainTitle.centerYAnchor.constraint(equalTo: isOn.centerYAnchor),
            mainTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            
            
            hospital.leadingAnchor.constraint(equalTo: border.leadingAnchor, constant: 7),
            hospital.trailingAnchor.constraint(equalTo: border.trailingAnchor, constant: -5),
            hospital.centerYAnchor.constraint(equalTo: border.centerYAnchor)
            
        ])
    }
    
}

