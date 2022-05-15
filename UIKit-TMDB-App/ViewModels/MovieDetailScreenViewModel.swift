//
//  MovieDetailScreenViewModel.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

final class MovieDetailScreenViewModel {
    
    private var movie: MovieInfo?
    
    static let shared = MovieDetailScreenViewModel()
    
    func fetchMovie(with id: Int, completion: @escaping () -> Void) {
        TMDbManager.shared.fetchMovie(with: K.TMDB.url + "movie/\(id)?api_key=" + K.TMDB.key) { [weak self] result in
            switch result {
            case.success(let data):
                print("Get data Success")
                
                self?.movie = data
                                
                completion()
                
            case.failure(let error):
                print("Failed: \(error)")
            }
        }
    }
    
    func getMovie() -> MovieInfo? {
        return movie
    }
}
