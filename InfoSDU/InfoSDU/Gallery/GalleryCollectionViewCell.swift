//
//  GalleryCollectionViewCell.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class GalleryCollectionViewCell: UICollectionViewCell {
    
    lazy var image: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "at"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(image)
        
    }
    
    override func layoutSubviews() {
        image.frame = self.bounds
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
