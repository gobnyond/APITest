//
//  Image.swift
//  ApiTest
//
//  Created by 정수빈 on 2022/02/02.
//

import Foundation

extension UIImageView { func load(url: URL) { DispatchQueue.global().async { [weak self] in if let data = try? Data(contentsOf: url) { if let image = UIImage(data: data) { DispatchQueue.main.async { self?.image = image } } } } } }

