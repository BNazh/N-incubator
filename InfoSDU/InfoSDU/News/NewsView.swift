//
//  NewsView.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 23.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class NewsView: UIView {
    
    var newsController = NewsTableViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .cyan
        
        self.addSubViews([newsController.view])
        
        addCustomConstraints()
        
        
//        DataFromHTML.init()
    }
    
    func addCustomConstraints() {
        constrain(self, newsController.view){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height
            v2.center == v1.center
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

