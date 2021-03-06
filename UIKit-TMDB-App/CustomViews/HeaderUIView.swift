//
//  HeaderUIView.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 14.05.2022.
//

import UIKit
import ImageSlideshow

class HeaderUIView: UIView {
    
    private var title = [String]()
    private var overview = [String]()
    
    var displayingMovie: Int = 0
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = K.HeaderView.titleFont
        label.numberOfLines = 2
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 6
        label.font = K.HeaderView.descriptionFont
        
        return label
    }()

    private let slideshow: ImageSlideshow = {
        let slideshow = ImageSlideshow()
        
        slideshow.clipsToBounds = true
        slideshow.slideshowInterval = K.HeaderView.slideshowInterval
        slideshow.contentScaleMode = .scaleAspectFill
        slideshow.activityIndicator = DefaultActivityIndicator()
        return slideshow
    }()

    init(frame: CGRect, recognizer: UITapGestureRecognizer) {
        super.init(frame: frame)
        addSubview(slideshow)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        slideshow.delegate = self
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
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            descriptionLabel.widthAnchor.constraint(equalToConstant: frame.size.width - 20)
        ]

        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }

    func configure(with model: [MovieInfo]) {
        var imageSource = [AlamofireSource]()
        
        for model in model {
            
            title.append(model.original_title)
            overview.append(model.overview)
            imageSource.append(AlamofireSource(urlString: K.TMDB.posterUrl + model.backdrop_path!)!)
        }
        slideshow.setImageInputs(imageSource)
        
        titleLabel.text = model[0].original_title
        titleLabel.textColor = .white
        descriptionLabel.text = model[0].overview
        descriptionLabel.textColor = .white
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
        displayingMovie = page
        
        titleLabel.text = title[page]
        titleLabel.textColor = .white
        descriptionLabel.text = overview[page]
        descriptionLabel.textColor = .white
    }
}
