//
//  NewsViewController.swift
//  SDULive
//
//  Created by Babakhanov Nazhmeddin on 21.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class NewsViewController: UIViewController {
    
    var dataFromCell: DataToSend?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        titleLabel.text = dataFromCell?.news.Title
        navigationItem.titleView = titleLabel
        
        view.addSubview(newsImage)
        
        setupViews()
    }
    
    let newsImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "stars_sky_space_car_113629_3840x2160"))
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let comments: UITextView = {
        let label = UITextView()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        label.isEditable = false
        return label
    }()
    
    func setupViews() {
        newsImage.image = dataFromCell?.news.Image
        comments.text = dataFromCell?.news.Description
        newsImage.layer.cornerRadius = 5
        view.addSubview(newsImage)
        view.addSubview(comments)
        
        view.addContraintsWithVisualFormat("H:|-16-[v0]-16-|", [newsImage])
        view.addContraintsWithVisualFormat("V:|-\((navigationController?.navigationBar.bounds.height)!+36)-[v0(\((view.bounds.width - 16 - 16)*9/16 + 16 + 68))]|", [newsImage])
        
        constrain(newsImage, comments){ v1, v2 in
            v2.width == v1.width
            v2.height == (v2.superview?.height)! * 0.4
            v2.top == v1.bottom + 20
            v2.centerX == v1.centerX
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
