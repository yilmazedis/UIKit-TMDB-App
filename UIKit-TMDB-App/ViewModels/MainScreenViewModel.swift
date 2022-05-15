//
//  MainScreenViewModel.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

final class MainScreenViewModel {
    
    private var moviesNowPlaying: [MovieInfo]? = []
    private var moviesUpcoming: [MovieInfo]? = []
    static let shared = MainScreenViewModel()
    
    func fetchNowPlayingMovies(completion: @escaping () -> Void) {
        
        TMDbManager.shared.getMovies(with: K.TMDB.url + "movie/now_playing?api_key=" + K.TMDB.key) { [weak self] result in
            switch result {
            case.success(let data):
                print("Get data Success")
                
                self?.moviesNowPlaying = data
                
                print(self?.moviesNowPlaying?[0].original_title as Any)
                
                completion()
                
            case.failure(let error):
                print("Failed: \(error)")
            }
        }
    }
    
    func getNowPlayingMovies() -> [MovieInfo]? {
        return moviesNowPlaying
    }
    
    func getUpcomingMovie(at index: Int) -> MovieInfo {

        guard let movies = moviesUpcoming else {
            return MovieInfo(original_title: "",
                             overview: "",
                             vote_average: 0,
                             release_date: "",
                             poster_path: "",
                             backdrop_path: "")
        }
        return movies[index]
    }
    
    func getUpcomingMovieCount() -> Int {
        return moviesUpcoming?.count ?? 0
    }
    
    func fetchUpcomingMovies(completion: @escaping () -> Void) {
        TMDbManager.shared.getMovies(with: K.TMDB.url + "movie/upcoming?api_key=" + K.TMDB.key) { [weak self] result in
            switch result {
            case.success(let data):
                print("Get data Success")
                
                self?.moviesUpcoming = data
                
                print(self?.moviesUpcoming?[0].original_title as Any)
                
                completion()
                
            case.failure(let error):
                print("Failed: \(error)")
            }
        }
    }
}
