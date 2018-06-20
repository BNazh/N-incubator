//
//  Extensions.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 10.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubViews(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}

extension UIColor {
    
    static let restaurantBottomViewColor =  UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    
}

extension UIImageView {
    func addBlackGradientLayer(frame: CGRect){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.black.withAlphaComponent(0.6).cgColor, UIColor.clear.cgColor]
        self.layer.addSublayer(gradient)
    }
}

extension UITableViewCell {
    func addBlackGradientLayer(frame: CGRect){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.1).cgColor]
        self.layer.addSublayer(gradient)
    }
}
