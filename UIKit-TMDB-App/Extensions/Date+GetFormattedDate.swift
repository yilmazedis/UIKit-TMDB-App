//
//  Date+Ext.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 16.05.2022.
//

import Foundation

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
