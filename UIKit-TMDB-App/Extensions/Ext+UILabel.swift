//
//  Extension+UILabel.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 15.05.2022.
//

import UIKit

extension UILabel {
    func labelColorChange(for givenText: String, into color: UIColor, from locationNumber: Int, to length: Int){
        let myMutableString = NSMutableAttributedString(string: givenText as String)
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor,
                                     value: color,
                                     range: NSRange(location: locationNumber, length: length))
        self.attributedText = myMutableString
    }
}
