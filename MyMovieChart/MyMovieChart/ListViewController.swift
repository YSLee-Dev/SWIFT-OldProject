//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 이윤수 on 2020/10/29.
//

import UIKit

class ListViewController : UITableViewController{
    
    // 테이블 뷰를 구성할 리스트 데이터
    var list = [MovieVO]()
    // 현재까지 읽어온 데이터의 페이지 정보
    var page = 1
    
    @IBOutlet var moreBtn: UIButton!
    
    func callMovieAPI(){
        // 호핀 API 호출을 위한 URI를 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        
        let apiURI: URL! = URL(string:url)
        
        // REST API 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 데이터 전송 결과를 로그로 출력 (필수X)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog(log as String)
        
        // JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do{
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: [])as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // 전체 데이터 카운트를 얻는다.
            let totalCount = (hoppin["totalCount"]as? NSString)!.integerValue
            
            // totalCount가 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다.
            if(self.list.count>=totalCount){
                self.moreBtn.isHidden = true
            }
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO객체에 저장한다.
            for row in movie{
                // 순회 상수를 NSDictionary타입으로 캐스팅
                let r = row as! NSDictionary
                
                //테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                // Movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["description"] as? String
                mvo.img = r["thumbnailImage"] as? String
                mvo.detail = r["detail"] as? String
                mvo.url = r["linkUrl"]as? String
                mvo.rating = ((r["ratingAverage"]as! NSString).doubleValue)
                
                // 웹상에 있는 이미지를 읽어와 UIImage 객체로 생성
                let url: URL! = URL(string: mvo.img!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                
                // list 배열에 추가
                self.list.append(mvo)
            }
        }catch{}
        
    }
    
    func getThumbnailImage(_ index:Int) ->UIImage{
        // 인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
        
        // 메모이제이션: 저장된 이미지가 있으면 그것을 반환하고, 없을 경우 내려받아 저장 후 반환
        if let savedImage = mvo.thumbnailImage{
            return savedImage
        }else{
            let url:URL! = URL(string: mvo.img!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
    override func viewDidLoad() {
        // 영화차트 API 호출
        self.callMovieAPI()
        /*
        
        // 첫 번째 행
        var mvo = MovieVO()
        mvo.title = "다크나이트"
        mvo.description = "영웅물에 철학에 음악까지 더해져 예술이 되다."
        mvo.opendate = "2008-09-04"
        mvo.rating = 8.95
        mvo.img = "shin1.jpg"
        // 배열에 추가
        self.list.append(mvo)
        
        // 두 번째 행
        mvo = MovieVO()
        mvo.title = "짱구는 못말려 극장판"
        mvo.description = "돼지발굽대작전"
        mvo.opendate = "2005-09-04"
        mvo.rating = 9.95
        mvo.img = "shin2.jpg"
        // 배열에 추가
        self.list.append(mvo)
 */
    }
     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count // iOS에게 내가 행이 몇개라고 알려주는 것
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        
        // 로그출력
        NSLog("제목\(row.title), 호출된 행번호: \(indexPath.row)")
        
        // 커스텀 클레스 사용
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        //cell.img.image= UIImage(named: row.img!)
        
        /*
        // 섬네일 경로를 인자값으로 하는 URL 객체를 생성
        let url:URL! = URL(string: row.img!)
        // 이미지를 읽어와 DATA객체에 저장
        let imageData = try! Data(contentsOf: url)
        // UIImage객체를 생성하여 아웃렛 변수의 image 속성에 대입
        cell.img.image = UIImage(data: imageData)
        */
        
        // 비동기 방식으로 섬네일 이미지를 읽어옴
        DispatchQueue.main.async(execute: {
            cell.img.image = row.thumbnailImage
            NSLog("비동기 부분")
        })
        NSLog("셀 리턴 후 메소드 종료")
        
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
        // let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        
        // 타이틀에 데이터 연결
        // cell.textLabel?.text = row.title
        // 서브타이틀에 데이터 연결
        // cell.detailTextLabel?.text = row.description
        
        // -> 커스텀 프로토타입 쉘
        // let title = cell.viewWithTag(101)as? UILabel
        // let desc = cell.viewWithTag(102)as? UILabel
        // let opendate = cell.viewWithTag(103)as? UILabel
        // let rating = cell.viewWithTag(104)as? UILabel
        
        // 데이터 소스에 저장된 값을 각 레이블 변수에 할당
        // title?.text = row.title
        // desc?.text = row.description
        // opendate?.text = row.opendate
        // rating?.text = "\(row.rating!)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
                                IndexPath) {
        let dvc = self.storyboard?.instantiateViewController(identifier: "dvc") as! DetailViewController
        
        dvc.url_s = list[indexPath.row].url
        dvc.title_s = list[indexPath.row].title
        
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func more(_ sender: Any) {
       // 현재 페이지 값에 1을 추가한다.
        self.page += 1
    
        // 영화차트 API 호출
        self.callMovieAPI()
        
        // 데이터를 다시 읽어오도록 테이블 뷰 갱신
        self.tableView.reloadData()
        
    }
    
}









