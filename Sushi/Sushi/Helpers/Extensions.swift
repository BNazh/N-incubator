//
//  Extensions.swift
//  Sushi
//
//  Created by MacBook on 10.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//  Nazhmeddin Babakhanov

import Foundation
import UIKit

extension UIImage {
    class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect: CGRect = CGRect(x:0,y: 0,width: size.width, height:size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIView{
    func addViews(_ view:[UIView]){
        for i in view{
            self.addSubview(i)
        }
    }
}
