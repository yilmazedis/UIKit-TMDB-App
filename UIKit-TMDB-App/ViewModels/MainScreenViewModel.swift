//
//  MainScreenViewModel.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

final class MainScreenViewModel {
    
    private var movies: [MovieInfo]? = []
    static let shared = MainScreenViewModel()
    
    func fetchNowPlayingMovies(completion: @escaping () -> Void ) {
        
        TMDbManager.shared.getMovies(with: K.TMDB.url + "movie/now_playing?api_key=" + K.TMDB.key) { [weak self] result in
            switch result {
            case.success(let data):
                print("Get data Success")
                
                self?.movies = data
                
                print(self?.movies?[0].original_title as Any)
                
                completion()
                
            case.failure(let error):
                print("Failed: \(error)")
            }
        }
    }
    
    func getMovies() -> [MovieInfo]? {
        return movies
    }
    
//    func getMovies(at index: Int) -> MovieInfo {
//
//        guard let movies = movies else {
//            return MovieInfo(original_title: "",
//                             overview: "",
//                             vote_average: 0,
//                             release_date: "",
//                             poster_path: "")
//        }
//        return movies[index]
//    }
    
//    func fetchUpcomingMovies() {
//
//    }
    
    
    
}
