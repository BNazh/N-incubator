//
//  MenuTableViewCell.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 11.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//

import UIKit
import Cartography

class MenuTableViewCell: UITableViewCell {
    
//    MARK: Properties
    
    lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
//    MARK: Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        addCustomConstraints()
        
    }
    
    private func setupViews() {
        
        self.addSubViews(views: [mainImage, typeLabel])
        
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: Constraints
    private func addCustomConstraints() {
        
        constrain(self, mainImage) { view, mainImage in
            mainImage.width == view.width
            mainImage.height == view.height
            mainImage.center == view.center
        }
        
        constrain(mainImage, typeLabel) { mainImage, typeLabel in
            typeLabel.width == mainImage.width * 0.5
            typeLabel.height == mainImage.height / 3
            typeLabel.top == mainImage.top
            typeLabel.left == mainImage.left + self.bounds.width * 0.1
        }
    
    }
    
}
