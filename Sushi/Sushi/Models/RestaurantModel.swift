//
//  RestaurantModel.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 10.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//  Nazhmeddin Babakhanov

import UIKit

struct RestaurantModel {
    public var image: UIImage
    public var title: String
    public var mass: String
    public var price: String
    
    init(_ image: UIImage, _ title: String, _ mass: String, _ price: String) {
        self.image = image
        self.title = title
        self.mass = mass
        self.price = price
    }
}
