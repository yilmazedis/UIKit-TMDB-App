//
//  HeaderUIView.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 14.05.2022.
//

import UIKit
import ImageSlideshow

class HeaderUIView: UIView {
    
//    private let localSource = [BundleImageSource(imageString: "American Beauty"),
//                               BundleImageSource(imageString: "Green Book"),
//                               BundleImageSource(imageString: "The Great Beauty"),
//                               BundleImageSource(imageString: "There Will Be Blood")]
//
    
    private var title = [String]()
    private var overview = [String]()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 375.0, height: 256.0))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.text = "Sonic the Hedgehog 2 "
        
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 375.0, height: 256.0))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 6
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.text = "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands."
        
        return label
    }()

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
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        //slideshow.pageIndicator =
        slideshow.delegate = self
        //slideshow.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        applyConstraints()
    }
    
    private func applyConstraints() {

        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -15),
            titleLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 20)
        ]

        let descriptionLabelConstraints = [
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            descriptionLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 20)
        ]

        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }

    @objc func didTap() {
//        let fullScreenController = slideshow.presentFullScreenController(from: self)
//        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }

    func configure(with model: [MovieInfo]) {
        
    
        var imageSource = [AlamofireSource]()
        
        for model in model {
            
            title.append(model.original_title)
            overview.append(model.overview)
            
            imageSource.append(AlamofireSource(urlString: "https://image.tmdb.org/t/p/original/" + model.poster_path)!)
        }
            
        slideshow.setImageInputs(imageSource)
    }

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
        
        titleLabel.text = title[page]
        descriptionLabel.text = overview[page]
        
        print("current page:", page)
    }
}
