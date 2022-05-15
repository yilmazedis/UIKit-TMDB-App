//
//  Movie.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

struct Movie: Decodable{
    let results: [MovieInfo]
}

struct MovieInfo: Decodable {
    let original_title: String
    let overview: String
    let vote_average: Float
    let release_date: String
    let poster_path: String
}
