//
//  MainTabBarController.swift
//  Sushi
//
//  Created by MacBook on 09.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        selectTabBarBacgroundColor()
    }
    
    func selectTabBarBacgroundColor(){
        let numberOfItems = CGFloat(4)
        let tabBarItemSize = CGSize(width: (self.tabBar.frame.width) / numberOfItems,height: (self.tabBar.frame.height))
        self.tabBar.selectionIndicatorImage
            = UIImage.imageWithColor(color: #colorLiteral(red: 1, green: 0.4431372549, blue: 0, alpha: 1),size: tabBarItemSize).resizableImage(withCapInsets: .zero)
        self.tabBar.clipsToBounds = true
    }
}
