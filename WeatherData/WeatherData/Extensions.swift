//
//  Extensions.swift
//  WeatherData
//
//  Created by Babakhan Nazhmeddin on 15.03.2018.
//  Copyright © 2018 Babakhan Nazhmeddin. All rights reserved.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
