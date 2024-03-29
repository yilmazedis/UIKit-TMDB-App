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
    
    var paginationLength = 0
    
    func fetchNowPlayingMovies(completion: @escaping () -> Void) {
        TMDbManager.shared.fetchMovies(with: K.TMDB.url + "movie/now_playing?api_key=" + K.TMDB.key) { [weak self] result in
            switch result {
            case.success(let data):
                Logger.log(what: K.InfoMessage.api, about: .info)
                self?.moviesNowPlaying = data
                completion()
                
            case.failure(let error):
                Logger.log(what: K.ErrorMessage.movies, over: error)
            }
        }
    }
    
    func getNowPlayingMovies() -> [MovieInfo]? {
        return moviesNowPlaying
    }
    
    func getNowPlayingMovie(at index: Int) -> MovieInfo {
        guard let movies = moviesNowPlaying else {
            return MovieInfo(id: 0,
                             original_title: "",
                             overview: "",
                             release_date: "",
                             poster_path: "",
                             backdrop_path: "")
        }
        return movies[index]
    }
    
    func getUpcomingMovie(at index: Int) -> MovieInfo {

        guard let movies = moviesUpcoming else {
            return MovieInfo(id: 0,
                             original_title: "",
                             overview: "",
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
        TMDbManager.shared.fetchMovies(with: K.TMDB.url + "movie/upcoming?api_key=" + K.TMDB.key) { [weak self] result in
            switch result {
            case.success(let data):
                Logger.log(what: K.InfoMessage.api, about: .info)
                self?.moviesUpcoming = data
                self?.paginationLength = K.MainScreen.paginationAmount
                completion()
                
            case.failure(let error):
                Logger.log(what: K.ErrorMessage.movies, over: error)
            }
        }
    }
}
