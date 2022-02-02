//
//  Aladin.swift
//  ApiTest
//
//  Created by 정수빈 on 2022/01/28.
//

import Foundation

struct AladinOpen: Decodable {
    //var version: String
    //var logo: String
    //var title: String
    //var link: String
    //var pubDate: String
    //var totalResults: Int
    //var startIndex: Int
    //var itemsPerPage: Int
    //var query: String
    //var searchCategoryId: Int
    //var searchCategoryName: String
    var item: [Book]
}

struct Book: Decodable {
    var cover: String
    var title: String
    var priceStandard: Int
    var description: String
}
// 이미지, 제목, 가격, 요약(모든 내용)
