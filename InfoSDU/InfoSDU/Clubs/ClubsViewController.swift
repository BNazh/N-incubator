//
//  ClubsViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class ClubsViewController: UIViewController {
    
    var infoAboutClub: ClubInfo?

    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .cyan
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    lazy var titleOfClub: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    lazy var descriptionAboutClub: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
            super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        self.view.addSubViews([mainImage, titleOfClub, descriptionAboutClub])
        
        mainImage.image = infoAboutClub?.infoAboutClub.getImage
        titleOfClub.text = infoAboutClub?.infoAboutClub.getTitle
        descriptionAboutClub.text = infoAboutClub?.infoAboutClub.getDescription
        
        addConstraints()
    }


    func addConstraints() {

        constrain(view, mainImage){ v1, v2 in
            v2.width == v1.width * 0.6
            v2.height == v1.width * 0.6
            v2.top == v1.top + 80
            v2.centerX == v1.centerX
        }
        
        mainImage.layer.cornerRadius = view.bounds.width * 0.3
        
        constrain(mainImage, titleOfClub){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.top == v1.bottom + 5
            v2.centerX == v1.centerX
        }
        
        constrain(view, descriptionAboutClub){ v1, v2 in
            v2.width == v1.width * 0.8
            v2.height == v1.height/2
            v2.top == v1.centerY + 20
            v2.centerX == v1.centerX
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
