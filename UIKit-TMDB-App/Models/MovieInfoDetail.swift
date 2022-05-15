//
//  MovieInfoDetail.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

struct MovieInfoDetail: Decodable {
    let original_title: String
    let overview: String
    let vote_average: Float
    let release_date: String
    let backdrop_path: String?
    let imdb_id: String
}
