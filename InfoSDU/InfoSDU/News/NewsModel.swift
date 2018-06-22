//
//  NewsModel.swift
//  SDULive
//
//  Created by Babakhanov Nazhmeddin on 21.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import Foundation
import UIKit

class NewsModel {
    private var image: UIImage
    private var text: String
    private var title: String
    init(_ image: UIImage, _ title: String, _ text: String) {
        self.image = image
        self.text = text
        self.title = title
    }
    
    public var Image: UIImage {
        get{
            return image
        }
    }
    
    public var Description: String {
        get{
            return text
        }
    }
    public var Title: String {
        get{
            return title
        }
    }
}
