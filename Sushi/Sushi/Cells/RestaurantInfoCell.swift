//
//  RestaurantInfoCell.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 10.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//  Nazhmeddin Babakhanov

import UIKit
import Cartography

class RestaurantInfoCell: UITableViewCell {
    
//    MARK: Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = #colorLiteral(red: 0.4428876115, green: 1, blue: 0.8820093792, alpha: 1)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
//    MARK: Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        addCustomConstraints()
        
    }
    
    private func setupViews() {
        
        self.addSubViews(views: [titleLabel, descriptionLabel])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addCustomConstraints() {
        
        constrain(self, titleLabel, descriptionLabel) { view, titleLabel, descriptionLabel in
            titleLabel.width == view.width * 0.9
            titleLabel.height == view.height * 0.3
            titleLabel.top == view.top
            titleLabel.centerX == view.centerX
            
            descriptionLabel.width == titleLabel.width
            descriptionLabel.height == view.height * 0.7
            descriptionLabel.top == titleLabel.bottom
            descriptionLabel.centerX == titleLabel.centerX
        }
        
    }
    
}
