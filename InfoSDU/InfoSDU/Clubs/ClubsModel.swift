//
//  ClubsModel.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import Foundation
import UIKit

class ClubsModel {
    private let image: UIImage
    private let title: String
    private let description: String
    
    init(_ image: UIImage, _ title: String, _ description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
    
    public var getImage: UIImage {
        get{
            return image
        }
    }
    
    public var getTitle: String {
        get{
            return title
        }
    }
    
    public var getDescription: String {
        get{
            return description
        }
    }
}
