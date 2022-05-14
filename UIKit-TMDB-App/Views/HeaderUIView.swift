//
//  HeaderUIView.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 14.05.2022.
//

import UIKit
import ImageSlideshow

class HeaderUIView: UIView {
    
    private let localSource = [BundleImageSource(imageString: "American Beauty"),
                               BundleImageSource(imageString: "Green Book"),
                               BundleImageSource(imageString: "The Great Beauty"),
                               BundleImageSource(imageString: "There Will Be Blood")]

    private let slideshow: ImageSlideshow = {
        let slideshow = ImageSlideshow()
        
        slideshow.clipsToBounds = true
        
        slideshow.slideshowInterval = 5.0
        //slideshow.pageIndicatorPosition = .init(horizontal: , vertical: .under)
        slideshow.contentScaleMode = .scaleAspectFill
        
        slideshow.activityIndicator = DefaultActivityIndicator()
        
        return slideshow
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(slideshow)
        
        //slideshow.pageIndicator =
        slideshow.delegate = self
        slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
    }

    @objc func didTap() {
//        let fullScreenController = slideshow.presentFullScreenController(from: self)
//        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

//    public func configure(with model: TitleViewModel) {
//        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
//            return
//        }
//
//        heroImageView.sd_setImage(with: url, completed: nil)
//    }

    override func layoutSubviews() {
        super.layoutSubviews()
        slideshow.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}

extension HeaderUIView: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
