//
//  ViewController.swift
//  MyProject - 9
//
//  Created by 이윤수 on 2021/03/22.
//
// 기본 방식 사용

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var ud = UserDefaults.standard
    let data = sdw()
    
    var count:Int = 0
    var view_heigth = 0
    var touch_tag:Int = 0
    
    var dview:UIView!
    var sc_dview:UIScrollView!
    var userIcon:UIImageView!
    var userIcon_view:UIView!
    var cgray:UIColor = UIColor(red: 0.298, green: 0.298, blue: 0.298, alpha: 1.0)
    var detail_view:UIView!
    var sv:UIScrollView!
    var info:UILabel!
    var dv_label:UILabel!
    var location:CLLocationCoordinate2D!
    var people_title:UILabel!
    var photo_title:UIButton!
    var sv_photo:UIScrollView!
    var map_title:UILabel!
    var map_view:MKMapView!
    var request_title:UILabel!
    var request_view:UIView!
    var Photo_plus:UIView!
    var Photo_blur_view:UIView!
    var touch_img:UIImageView!
    
    let img0 = UIImage(named: "main1.JPG")
    let img1 = UIImage(named: "main2.jpeg")
    let img2 = UIImage(named: "main3.JPG")
    let img3 = UIImage(named: "main4.JPG")
    let img4 = UIImage(named: "main5.jpeg")
    
    var img_list = [UIImage]()
    
    override func viewDidLoad() {
        
        // 유저 아이콘 뷰
        self.userIcon_view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        // 유저 아이콘
        self.userIcon = UIImageView(image: UIImage(named:"user.png"))
        self.userIcon.frame = CGRect(x: 0, y: 10, width: 23, height: 25)
        self.userIcon.isUserInteractionEnabled = true
        self.userIcon.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginP(_sender:))))
        self.userIcon_view.addSubview(userIcon)
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Please Login"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)
        ]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.userIcon_view)
        
        // 메인 스크롤 뷰
        self.sc_dview = UIScrollView(frame: CGRect(x: 0, y: 0, width: Int(self.view.frame.width)-35, height: Int(self.view.frame.height)))
        
        sc_dview.isPagingEnabled = false
        sc_dview.showsVerticalScrollIndicator = false
        sc_dview.center.x = self.view.frame.width/2
        self.view.addSubview(sc_dview)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        // 로그인 검증
        if ud.string(forKey: "loginC")=="O"{
            if self.count == 0{
                self.mViewload()
                self.count+=1
            }else{
                print("두번째")
            }
        }else{
            self.navigationItem.title = "Please Login"
            self.dview?.removeFromSuperview()
            self.count = 0
        }
    }
    
    func mViewload(){
        self.navigationItem.title = "MAIN"
        
        // 메인뷰
        self.dview = UIView(frame: CGRect(x: 0, y: 0, width: Int(self.sc_dview.frame.width), height: 0))
        // self.dview.backgroundColor = .blue
        self.sc_dview.addSubview(dview)
        
        // 미리 선언
        self.people_title = UILabel(frame: CGRect(x:0, y: 30, width: 100, height: 100))
        self.sv = UIScrollView(frame: CGRect(x: 0, y: 50, width: self.dview.frame.width, height: 40))
        self.detail_view = UIView(frame: CGRect(x: 0, y: 100, width: self.dview.frame.width, height: 90))
        self.photo_title = UIButton(type: .custom)
        self.photo_title.frame = CGRect(x:0, y: 200, width: 100, height: 100)
        self.sv_photo = UIScrollView(frame: CGRect(x: 0, y: 240, width: self.dview.frame.width, height: 100))
        self.map_title  = UILabel(frame: CGRect(x: 0, y: 360, width: 100, height: 100))
        self.map_view = MKMapView(frame: CGRect(x: 0, y: 390, width: self.dview.frame.width, height: 200))
        self.request_title = UILabel(frame: CGRect(x: 0, y: 610, width: 100, height: 100))
        self.request_view = UIView(frame: CGRect(x: 0, y: 635, width: self.dview.frame.width, height: 50))
        
        // 뷰 size
        self.view_heigth = Int(self.people_title.frame.size.height)+Int(self.sv.frame.size.height)+Int(self.detail_view.frame.size.height)+Int(self.photo_title.frame.size.height)+Int(self.sv_photo.frame.size.height)+Int(self.map_title.frame.size.height)+Int(self.map_view.frame.size.height)+Int(self.request_title.frame.size.height)+Int(self.request_view.frame.size.height)
        
        
        self.sc_dview.contentSize = CGSize(width: Int(self.view.frame.width)-35, height: self.view_heigth - 200)
        self.dview.frame.size.height = CGFloat(self.view_heigth - 200)
        
        print(sc_dview.frame.size.height - 200)
        
        // people_title
        self.people_title.text = "People"
        self.people_title.font = UIFont.boldSystemFont(ofSize: 18)
        self.people_title.sizeToFit()
        self.dview.addSubview(people_title)
        
        // 스크롤 view
        
        self.sv.contentSize = CGSize(width: 640, height: 40)
        // sv.backgroundColor = UIColor.orange
        self.sv.bounces = false
        self.sv.isPagingEnabled = false
        self.sv.showsHorizontalScrollIndicator = false
        self.dview.addSubview(sv)
        
        // 스크롤 view_view
        let sv_view = UIView(frame: CGRect(x: 0, y: 0, width: 660, height: sv.frame.height))
        sv.addSubview(sv_view)
        
        // 최영민
        let user0 = UIButton(type: .custom)
        // 이윤수
        let user1 = UIButton(type: .custom)
        // 이예슬
        let user2 = UIButton(type: .custom)
        // 이승민
        let user3 = UIButton(type: .custom)
        // 김정한
        let user4 = UIButton(type: .custom)
        // 조용욱
        let user5 = UIButton(type: .custom)
        // 류인환
        let user6 = UIButton(type: .custom)
        // 이수민
        let user7 = UIButton(type: .custom)
        // 안영현
        let user8 = UIButton(type: .custom)
        
        let user_Btn = [user0,user1,user2,user3,user4,user5,user6,user7,user8]
        var btn_List_count = 0
        var btn_Cg_X = 0
        
        for button in user_Btn{
            button.setTitle(self.data.sdwList[btn_List_count], for: .normal)
            button.frame = CGRect(x: btn_Cg_X, y: 10, width: 60, height: 30)
            button.tag = btn_List_count
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            button.setTitleColor(self.cgray, for: .normal)
            button.layer.borderColor = self.cgray.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 13
            button.addTarget(self, action: #selector(nameClick(_sender :)), for: .touchUpInside)
            
            btn_List_count+=1
            btn_Cg_X+=70
            
            sv_view.addSubview(button)
        }
        
        // 상세내용 view
        self.detail_view.backgroundColor = UIColor(red: 0.9294, green: 0.9294, blue: 0.9294, alpha: 1.0)
        self.detail_view.layer.cornerRadius = 10
        self.dview.addSubview(self.detail_view)
        
        // 상세내용 label
        self.info  = UILabel()
        self.info.numberOfLines = 4
        self.info.font = UIFont.systemFont(ofSize: 15)
        
        // 상세내용 안내 label
        self.dv_label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.dv_label.text = "Tap your name to see the contents."
        self.dv_label.font = UIFont.systemFont(ofSize: 15)
        self.dv_label.textColor = UIColor(red: 0.7176, green: 0.7176, blue: 0.7176, alpha: 1.0)
        self.dv_label.sizeToFit()
        self.dv_label.center.x = detail_view.frame.width/2
        self.dv_label.center.y = detail_view.frame.height/2
        detail_view.addSubview(self.dv_label)
        
        // photo title
        self.photo_title.setTitle("Photo >", for: .normal)
        self.photo_title.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.photo_title.setTitleColor(UIColor.black, for: .normal)
        self.photo_title.sizeToFit()
        self.photo_title.addTarget(self, action: #selector(photoTitleClick(_sender:)), for: .touchUpInside)
        self.dview.addSubview(photo_title)
        
        // photo s_view
        self.sv_photo.contentSize = CGSize(width: 750, height: 100)
        self.sv_photo.bounces = false
        self.sv_photo.showsHorizontalScrollIndicator = false
        self.dview.addSubview(sv_photo)
        
        // photo view
        let photo_view = UIView(frame: CGRect(x: 0, y: 0, width: 800, height: sv_photo.frame.height))
        sv_photo.addSubview(photo_view)
        
        // photo 0
        let ph0 = UIImageView(image: self.img0)
        // photo 1
        let ph1 = UIImageView(image: self.img1)
        // photo 2
        let ph2 = UIImageView(image: self.img2)
        // photo 3
        let ph3 = UIImageView(image: self.img3)
        // photo 4
        let ph4 = UIImageView(image: self.img4)
        
        let photo = [ph0,ph1,ph2,ph3,ph4]
        var ph_Cg_x = 0
        var ph_List_count = 0
        
        for ph in photo{
            ph.frame = CGRect(x: ph_Cg_x, y: 0, width: 130, height: 100)
            ph.clipsToBounds = true
            ph.layer.cornerRadius = 10
            ph.tag = ph_List_count
            ph.isUserInteractionEnabled = true
            ph.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(photoClick(_sender:))))
            
            ph_Cg_x+=150
            ph_List_count+=1
            
            photo_view.addSubview(ph)
        }
        
        
        // map title
        self.map_title.text = "Map(MIGOL)"
        self.map_title.font = UIFont.boldSystemFont(ofSize: 18)
        self.map_title.sizeToFit()
        self.dview.addSubview(map_title)
        
        // 위도와 경도를 인수로 하는 2D 위치정보 객체 정의
        self.location = CLLocationCoordinate2D(latitude: 37.436721, longitude: 127.157556)
        // 지도 데이터 생성
        let coordinateRegion = MKCoordinateRegion(center: self.location, latitudinalMeters: 100, longitudinalMeters: 100)
        // map_view 변수에 연결된 지도 객체에 데이터를 전달하여 화면에 표시
        self.map_view.setRegion(coordinateRegion, animated: true)
        
        // 위치를 표시해줄 객체를 생성하고, 앞에서 작성해준 위치값 객체를 할당
        let point = MKPointAnnotation()
        point.coordinate = self.location
        point.title = "미골"
        self.map_view.addAnnotation(point)
        
        self.map_view.isPitchEnabled = false
        self.dview.addSubview(self.map_view)
        
        // request title
        self.request_title.text = "Request"
        self.request_title.font = UIFont.boldSystemFont(ofSize: 18)
        self.request_title.sizeToFit()
        self.dview.addSubview(self.request_title)
        
        // request view
        // self.request_view.backgroundColor = .blue
        self.dview.addSubview(self.request_view)
        
        // request is migol
        let request_migol = UIButton(type: .custom)
        request_migol.setTitle("미골로 모여라", for: .normal)
        request_migol.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        request_migol.frame = CGRect(x: 0, y: 5, width: 100, height: 30)
        request_migol.backgroundColor = self.cgray
        request_migol.layer.cornerRadius = 13
        request_migol.center.x = self.dview.frame.width/2
        request_migol.addTarget(self, action: #selector(request_migol_go(_sender:)), for: .touchUpInside)
        self.request_view.addSubview(request_migol)
        
    }
    @objc func loginP(_sender:Any){
        
        let alert = UIAlertController(title: "Memu", message: "Select the menu you want", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login Page", style: .default){_ in
            let lv =  LoginViewController()
            lv.modalPresentationStyle = .fullScreen
            
            self.present(lv, animated: true)
        })
        alert.addAction(UIAlertAction(title: "Help", style: .default){_ in
            
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        self.present(alert, animated: true)
    }
    
    @objc func nameClick(_sender:Any){
        let touch_tag = (Int((_sender as AnyObject).tag!))
        var count:Int = 0
        
        // 상세내용 label, 안내라벨
        self.info?.removeFromSuperview()
        self.dv_label?.removeFromSuperview()
        
        for name in data.sdwList{
            if touch_tag == count{
                info.text = data.info[count]
                print(name)
                break
            }else{
                count+=1
            }
        }
        self.info.frame = CGRect(x: 15, y: 10, width: 300, height: 100)
        self.info.sizeToFit()
        self.info.numberOfLines = 4
        self.info.font = UIFont.systemFont(ofSize: 15)
        self.detail_view.addSubview(self.info)
    }
    
    @objc func photoTitleClick(_sender:Any){
        self.tabBarController?.selectedIndex = 1
    }
    
    @objc func photoClick(_sender:Any){
        
        self.touch_tag = Int((_sender as AnyObject).view!.tag)
        
        // 블러
        self.Photo_blur_view = UIView()
        self.Photo_blur_view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.Photo_blur_view.translatesAutoresizingMaskIntoConstraints = false
        self.Photo_blur_view.isUserInteractionEnabled = true
        self.Photo_blur_view.alpha = 0
        self.view.addSubview(Photo_blur_view)
        self.Photo_blur_view.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.Photo_blur_view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        // 사진 출력
        self.Photo_plus = UIView()
        self.touch_img = UIImageView()
        
        self.img_list.append(self.img0!)
        self.img_list.append(self.img1!)
        self.img_list.append(self.img2!)
        self.img_list.append(self.img3!)
        self.img_list.append(self.img4!)
        
        
        self.touch_img.image = img_list[touch_tag]
        
        self.Photo_plus.addSubview(touch_img)
        touch_img.translatesAutoresizingMaskIntoConstraints = false
        touch_img.widthAnchor.constraint(equalTo: self.Photo_plus.widthAnchor).isActive = true
        touch_img.heightAnchor.constraint(equalTo: self.Photo_plus.heightAnchor).isActive = true
        
        self.Photo_plus.translatesAutoresizingMaskIntoConstraints = false
        self.Photo_plus.alpha = 0
        self.Photo_blur_view.addSubview(Photo_plus)
        self.Photo_plus.centerXAnchor.constraint(equalTo: self.sc_dview.centerXAnchor).isActive = true
        self.Photo_plus.centerYAnchor.constraint(equalTo: self.sc_dview.centerYAnchor).isActive = true
        self.Photo_plus.widthAnchor.constraint(equalTo: self.sc_dview.widthAnchor, multiplier: 0.9).isActive = true
        self.Photo_plus.heightAnchor.constraint(equalTo: self.Photo_plus.widthAnchor, multiplier: 0.7).isActive = true
        
        UIView.animate(withDuration: 0.2, animations: {
            self.Photo_blur_view.alpha = 1
            self.Photo_plus.alpha = 1
        })
        
        let photo_cv = UIView()
        photo_cv.translatesAutoresizingMaskIntoConstraints = false
        self.Photo_blur_view.addSubview(photo_cv)
        photo_cv.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        photo_cv.heightAnchor.constraint(equalTo: self.Photo_plus.heightAnchor).isActive = true
        photo_cv.topAnchor.constraint(equalTo: self.Photo_plus.centerYAnchor).isActive = true
        
        let photo_back = UIButton(type: .custom)
        photo_back.setBackgroundImage(UIImage(named: "back.png"), for: .normal)
        photo_back.isUserInteractionEnabled = true
        photo_back.addTarget(self, action: #selector(photo_back(_:)), for: .touchUpInside)
        photo_back.translatesAutoresizingMaskIntoConstraints = false
        photo_cv.addSubview(photo_back)
        photo_back.widthAnchor.constraint(equalToConstant: 15).isActive = true
        photo_back.heightAnchor.constraint(equalToConstant: 20).isActive = true
        photo_back.leadingAnchor.constraint(equalTo: self.Photo_blur_view.leadingAnchor, constant: 5).isActive = true
        photo_back.centerYAnchor.constraint(equalTo: self.Photo_blur_view.centerYAnchor).isActive = true
        
        let photo_next = UIButton(type: .custom)
        photo_next.setBackgroundImage(UIImage(named: "next.png"), for: .normal)
        photo_next.isUserInteractionEnabled = true
        photo_next.tag = touch_tag
        photo_next.addTarget(self, action: #selector(photo_next(_:)), for: .touchUpInside)
        photo_next.translatesAutoresizingMaskIntoConstraints = false
        photo_cv.addSubview(photo_next)
        photo_next.widthAnchor.constraint(equalToConstant: 15).isActive = true
        photo_next.heightAnchor.constraint(equalToConstant: 20).isActive = true
        photo_next.trailingAnchor.constraint(equalTo: self.Photo_blur_view.trailingAnchor, constant: -5).isActive = true
        photo_next.centerYAnchor.constraint(equalTo: self.Photo_blur_view.centerYAnchor).isActive = true
        
        let photo_exit = UIButton(type: .custom)
        photo_exit.setBackgroundImage(UIImage(named: "close_icon.png"), for: .normal)
        photo_exit.translatesAutoresizingMaskIntoConstraints = false
        photo_exit.addTarget(self, action: #selector(photo_exit(_:)), for: .touchUpInside)
        self.Photo_blur_view.addSubview(photo_exit)
        photo_exit.widthAnchor.constraint(equalToConstant: 40).isActive = true
        photo_exit.heightAnchor.constraint(equalToConstant: 40).isActive = true
        photo_exit.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        photo_exit.centerYAnchor.constraint(equalTo: self.Photo_plus.bottomAnchor, constant: 50).isActive = true
    }
    
                
    
    @objc func photo_exit(_ sender:Any){
        UIView.animate(withDuration: 0.2, animations: {
            self.Photo_blur_view.alpha = 0
            self.Photo_plus.alpha = 0
        },completion: {_ in
            self.Photo_blur_view.removeFromSuperview()
            print("뷰 사라짐")
        })
        
    }
    
    @objc func photo_back(_ count:Any){
        if self.touch_tag != 0 {
            
            self.touch_img.alpha = 0
            self.touch_img.image = self.img_list[self.touch_tag-1]
            self.touch_tag -= 1
            self.photo_ani()
        }
    }
    @objc func photo_next(_ sender:Any){
        if self.touch_tag != 4 {
            
            self.touch_img.alpha = 0
            self.touch_img.image = self.img_list[self.touch_tag+1]
            self.touch_tag += 1
            self.photo_ani()
        }
    }
    
    func photo_ani(){
        UIView.animate(withDuration: 0.2, animations: {
            self.touch_img.alpha = 1
        })
    }
    
    @objc func request_migol_go(_sender:Any){
        let alert = UIAlertController(title: "Request", message: "미골에서 만나자고 호출을 할까요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default){_ in
            let cv = CallViewController()
            self.present(cv, animated: true)
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        self.present(alert, animated: true)
    }
}

