//
//  MovieInfo.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

struct MovieInfo: Decodable {
    let id: Int
    let original_title: String
    let overview: String
    let release_date: String
    let poster_path: String
    let backdrop_path: String?
}
