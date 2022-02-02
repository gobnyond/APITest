//
//  DetailAladinViewController.swift
//  ApiTest
//
//  Created by 정수빈 on 2022/01/28.
//

import UIKit

class DetailAladinViewController: UIViewController {
    
    @IBOutlet weak var detailcoverimage: UIImageView!
    @IBOutlet weak var detailtitleLabel: UILabel!
    @IBOutlet weak var detailpriceLabel: UILabel!
    @IBOutlet weak var detaildescriptionLabel: UILabel!
    
    var detailcover:UIImage?
    var detailtitle:String?
    var detailprice:String?
    var detaildescription:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailcoverimage.image = detailcover
        detailtitleLabel.text = detailtitle
        detailpriceLabel.text = detailprice
        detaildescriptionLabel.text = detaildescription
    }

}
