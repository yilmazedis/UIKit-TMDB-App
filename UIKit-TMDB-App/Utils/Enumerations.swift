//
//  Enumerations.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import Foundation

enum ManagerFail: Error {
    case data
    case error
    case response
    case statusCode
    case decode
}
