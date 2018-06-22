//
//  Extensions.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 23.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        for i in views {
            self.addSubview(i)
        }
    }
    
    func addContraintsWithVisualFormat(_ format: String, _ views: [UIView]){
        
        var viewsDictionary = [String : UIView]()
        
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
}
