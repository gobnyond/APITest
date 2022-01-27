//
//  MovieReponse.swift
//  ApiTest
//
//  Created by 정수빈 on 2022/01/27.
//

import Foundation
struct MovieResponse: Decodable {
    var status: String
    var status_message: String
    var data: MovieData
}

struct MovieData: Decodable {
    var movie_count: Int
    var movies: [Movie]
}

struct Movie: Decodable {
    var title: String
    var summary: String
}
