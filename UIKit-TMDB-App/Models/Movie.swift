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
