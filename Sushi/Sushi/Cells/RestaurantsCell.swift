//
//  RestaurantsCell.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 10.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//  Nazhmeddin Babakhanov

import UIKit
import Cartography

class RestaurantsCell: UITableViewCell {
    
//    MARK: Properties
    
    lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .restaurantBottomViewColor
        return view
    }()
    
    lazy var nameOfRestaurant: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "right-arrow"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
//    MARK: Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        addCustomConstraints()
        
    }
    
    private func setupViews() {
        
        self.addSubViews(views: [mainImage, bottomView])
        
        bottomView.addSubViews(views: [nameOfRestaurant, rightButton])
        
        self.selectionStyle = .none
        
    }
    
//    MARK: Constraints
    private func addCustomConstraints() {
        
        constrain(self, mainImage, bottomView) { view, mainImage, bottomView in
            mainImage.width == view.width
            mainImage.height == view.height
            mainImage.center == view.center
            
            bottomView.height == view.height / 5
            bottomView.width == view.width
            bottomView.centerX == view.centerX
            bottomView.bottom == view.bottom
        }
        
        constrain(bottomView, nameOfRestaurant, rightButton) { bottomView, nameOfRestaurant, rightButton in
            rightButton.width == bottomView.width * 0.2
            rightButton.height == bottomView.height
            rightButton.right == bottomView.right
            rightButton.top == bottomView.top
            
            nameOfRestaurant.width == bottomView.width * 0.75
            nameOfRestaurant.height == bottomView.height
            nameOfRestaurant.top == bottomView.top
            nameOfRestaurant.right == rightButton.left
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
