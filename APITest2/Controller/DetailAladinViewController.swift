//
//  DetailAladinViewController.swift
//  ApiTest
//
//  Created by μ μλΉ on 2022/01/28.
//

import UIKit

class DetailAladinViewController: UIViewController {
    
    @IBOutlet weak var detailcoverimage: UIImageView!
    @IBOutlet weak var detailtitleLabel: UILabel!
    @IBOutlet weak var detailpriceLabel: UILabel!
    @IBOutlet weak var detaildescriptionLabel: UILabel!
    
    var detailcover:String?
    var detailtitle:String?
    var detailprice:Int?
    var detaildescription:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: detailcover!)
        detailcoverimage.load(url: url!)
        detailtitleLabel.text = detailtitle
        detailpriceLabel.text = "\(detailprice ?? 0) μ"
        detaildescriptionLabel.text = detaildescription
    }

}
