//
//  AboutUs.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class AboutUs: UIView {

    var aboutController = AboutUsViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        self.addSubViews([aboutController.view])
        
        addCustomConstraints()
    }
    
    func addCustomConstraints() {
        constrain(self, aboutController.view){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height
            v2.center == v1.center
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
