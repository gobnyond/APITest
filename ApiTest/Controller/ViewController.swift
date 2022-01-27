//
//  ViewController.swift
//  ApiTest
//
//  Created by 정수빈 on 2022/01/27.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var MovieTable: UITableView!
    
    var movie: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MovieTable.delegate = self
        self.MovieTable.dataSource = self
        self.MovieTable.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        self.MovieTable.estimatedRowHeight = 50
        self.MovieTable.rowHeight = UITableView.automaticDimension

        self.getMovie()
    }

    //api 통신 alamofire
    //response handler
    //5가지 모두 사용은 post
    //get은 3가지 사용
    //validate:200번대, 300번대 스스로 걸러줌
    //resposeDecodable:어떤것을 받아올것이냐
    //closure?
    //response:결과값을 넘긴것
    func getMovie() {
        AF.request("https://yts.mx/api/v2/list_movies.json?sort_by=rating", method: .get, headers:nil)
            .validate()
            .responseDecodable(of: MovieResponse.self) { response in
                switch response.result {
                    //성공중의 성공, 성공중의 실패
                case .success(let response):
                    print(response.status_message)
                    print("불러온 영화의 개수: \(response.data.movie_count)")
                    self.movie = response.data.movies
                    //조심? 이렇게 특정 구조체를 하는 형태들을 잘 맞춰줘야 함
                    self.MovieTable.reloadData()
                    //테이블뷰 다시 만들기
            
                    print(self.movie)
                    print("success")
                    
                case .failure(let error):
                    print("failure: \(error.localizedDescription)")
            }
                
        }
        
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let data = self.movie[indexPath.row]
        cell.titleLabel.text = data.title
        cell.summaryLabel.text = data.summary
        
        cell.selectionStyle = .none
        return cell
        
    }
    
}
