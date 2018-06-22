//
//  GalleryViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class GalleryViewController: UIViewController {
    
    public var delegate: GalleryImage?
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = delegate?.currentImage
        view.addSubview(image)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        addConstraints()
    }
    
    func addConstraints() {
        
        constrain(view, image){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height * 0.4
            v2.center == v1.center
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
