//
//  CustomViewCell.swift
//  UIKit-TMDB-App
//
//  Created by yilmaz on 14.05.2022.
//

import UIKit

class CustomViewCell: UITableViewCell {

    lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 15)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    
    lazy var descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 13)
        //lbl.frame.inset(by: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var dateLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 13)
        //lbl.frame.inset(by: UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30))
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        return lbl
    }()
    
    lazy var posterImage : UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        //imgView.contentMode = .scaleAspectFit
        imgView.layer.cornerRadius = 10.0
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(posterImage)
        addSubview(descriptionLabel)
        addSubview(titleLabel)
        addSubview(dateLabel)
        
        applyConstraints()
    }
    
    private func applyConstraints() {

        
        posterImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        posterImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        posterImage.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        
        descriptionLabel.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: -45).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35).isActive = true
        
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func configure(with model: MovieInfo) {
        
        titleLabel.text = model.original_title
        descriptionLabel.text = model.overview
        dateLabel.text = model.release_date.replacingOccurrences(of: "-", with: ".")
        
        posterImage.af.setImage(withURL: URL(string: K.TMDB.posterUrl + model.poster_path)!)
    }
    
}
