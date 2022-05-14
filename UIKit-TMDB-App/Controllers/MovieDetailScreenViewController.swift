//
//  MovieDetailScreenViewController.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 14.05.2022.
//

import UIKit

class MovieDetailScreenViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentInsetAdjustmentBehavior = .never
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var imdbLineView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Moonrise Kingdom")
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var imdbImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "IMDB Logo")
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var starImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Rate Icon")
        iv.clipsToBounds = true
        return iv
    }()
    
    public lazy var dotImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "dot")
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var rateLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.text = "7.8/10"
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    lazy var dateLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "15.05.2021"
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Moonrise Kingdom (2012)"
        lbl.font = UIFont.systemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "Detail Screen"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .systemBackground
        navigationController?.hidesBarsOnSwipe = true
        
        commonInit()
    }
    
    private func commonInit() {
        setupScrollViewContstraints()
        setupContentViewConstraints()
        setupItemImageViewConstraints()
        setupItemIMDbLineConstraints()
        applyTitleLabelConstraints()
        setupDescriptionLabelConstraints()
    }
    
    private func setupScrollViewContstraints() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    private func setupContentViewConstraints() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = UILayoutPriority(250)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            heightConstraint,
        ])
    }
    
    private func setupItemImageViewConstraints() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.50)
        ])
    }
    
    private func setupItemIMDbLineConstraints() {
        contentView.addSubview(imdbLineView)
        
        imdbLineView.addSubview(imdbImage)
        imdbLineView.addSubview(starImage)
        imdbLineView.addSubview(rateLabel)
        imdbLineView.addSubview(dotImage)
        imdbLineView.addSubview(dateLabel)
          
        imdbLineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imdbLineView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            imdbLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            imdbLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imdbLineView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        applyIMDbLineConstraints()
    }
    
    private func applyIMDbLineConstraints() {
        imdbImage.translatesAutoresizingMaskIntoConstraints = false
        starImage.translatesAutoresizingMaskIntoConstraints = false
        rateLabel.translatesAutoresizingMaskIntoConstraints = false
        dotImage.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imdbImage.topAnchor.constraint(equalTo: imdbLineView.topAnchor, constant: 10),
            imdbImage.leadingAnchor.constraint(equalTo: imdbLineView.leadingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            starImage.topAnchor.constraint(equalTo: imdbLineView.topAnchor, constant: 13),
            starImage.leadingAnchor.constraint(equalTo: imdbImage.trailingAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            rateLabel.topAnchor.constraint(equalTo: imdbLineView.topAnchor, constant: 13),
            rateLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor,constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            dotImage.topAnchor.constraint(equalTo: imdbLineView.topAnchor, constant: 18),
            dotImage.leadingAnchor.constraint(equalTo: rateLabel.trailingAnchor,constant: 15),
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: imdbLineView.topAnchor, constant: 13),
            dateLabel.leadingAnchor.constraint(equalTo: dotImage.trailingAnchor,constant: 15),
        ])
    }
    
    private func applyTitleLabelConstraints() {
        contentView.addSubview(titleLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imdbLineView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
