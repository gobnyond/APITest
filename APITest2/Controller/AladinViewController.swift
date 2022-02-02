//
//  AladinViewController.swift
//  ApiTest
//
//  Created by 정수빈 on 2022/01/28.
//

import UIKit
import Alamofire
import CoreData

class AladinViewController: UIViewController {

    @IBOutlet weak var bookTableView: UITableView!
    
    var book: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        self.bookTableView.delegate = self
        self.bookTableView.dataSource = self
        self.bookTableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        self.bookTableView.estimatedRowHeight = 50
        self.bookTableView.rowHeight = UITableView.automaticDimension
        
        self.getBook()
    }
    
    func getBook() {
        AF.request("https://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbstarku22490125001&QueryType=ItemNewAll&MaxResults=25&start=1&SearchTarget=Book&output=js&Version=20131101", method: .get, headers: nil)
            .validate()
            .responseDecodable(of: AladinOpen.self) {response
                in
                switch response.result {
                case .success(let response):
                    self.book = response.item
                    self.bookTableView.reloadData()
                    print("success")
                    
                case .failure(let error):
                    //print("failure \(error.localizedDescription)")
                    print(String(describing: error))
            }
            
        }
        
    }
    
}

extension AladinViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.book.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        let data = self.book[indexPath.row]
        let url = URL(string: data.cover)
        cell.coverImage.load(url: url!)
        cell.titleLabel.text = data.title
        //cell.priceLabel.text = data.priceStandard 이거 아님 왜? price가 int로 선언되어 있어서
        //그래서 우리는 price를 문자열에 담기 .text = "\(price)"
        cell.priceLabel.text = "\(data.priceStandard)"
        cell.descriptionLabel.text = data.description

        
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailAladinViewController") as!
        DetailAladinViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
      // let data = self.book[indexPath.row]
        //let url = URL(string: data.cover)
        
        vc.detailcover = book[indexPath.row].cover
        vc.detailtitle = book[indexPath.row].title
        vc.detailprice = book[indexPath.row].priceStandard
        vc.detaildescription = book[indexPath.row].description
        
        }
    
        
}
    
extension UIImageView {
    func load(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
}
