//
//  TMDbManager.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation
import UIKit

enum ManagerFail: Error {
    case data
    case error
    case response
    case statusCode
    case decode
}

class TMDbManager {
    
    static let shared = TMDbManager()
    
    func fetchMovies(with urlStr: String, completion: @escaping (Result<[MovieInfo], Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            print("Fail to conver urlStr to url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data else {
                completion(.failure(ManagerFail.data))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ManagerFail.response))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(ManagerFail.statusCode))
                return
            }
            
            guard error == nil else {
                completion(.failure(ManagerFail.error))
                return
            }

            do {
                let result = try JSONDecoder().decode(Movie.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(ManagerFail.decode))
            }
        }
        task.resume()
    }
    
    func fetchMovie(with urlStr: String, completion: @escaping (Result<MovieInfoDetail, Error>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            print("Fail to conver urlStr to url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data else {
                completion(.failure(ManagerFail.data))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(ManagerFail.response))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(ManagerFail.statusCode))
                return
            }
            
            guard error == nil else {
                completion(.failure(ManagerFail.error))
                return
            }

            do {
                let result = try JSONDecoder().decode(MovieInfoDetail.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(ManagerFail.decode))
            }
        }
        task.resume()
    }
}
