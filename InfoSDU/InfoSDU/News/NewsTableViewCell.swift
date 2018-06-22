//
//  NewsTableViewCell.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 23.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
    }
    
    let newsImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "stars_sky_space_car_113629_3840x2160"))
        image.backgroundColor = .blue
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "at"))
        image.backgroundColor = .green
        image.clipsToBounds = true
        return image
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let titleOfNews: UILabel = {
        let label = UILabel()
        label.text = "werty"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    let comments: UILabel = {
        let label = UILabel()
        label.text = "werty dfgvhbn"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    func setupView(){
        addSubview(newsImage)
        addSubview(separatorView)
//        addSubview(profileImage)
        addSubview(titleOfNews)
        addSubview(comments)
        
        self.selectionStyle = .none
        
        addContraintsWithVisualFormat("H:|[v0]|", [newsImage])
        
        addContraintsWithVisualFormat("H:|[v0]|", [separatorView])
        
        addContraintsWithVisualFormat("V:|[v0(\((self.bounds.width - 16 - 16)*9/16 + 16 + 68))][v1(1)]|", [newsImage, separatorView])
        
        profileImage.layer.cornerRadius = 22
        
        addConstraint(NSLayoutConstraint(item: comments, attribute: .left, relatedBy: .equal, toItem: newsImage, attribute: .left, multiplier: 1, constant: 16))
        addConstraint(NSLayoutConstraint(item: comments, attribute: .bottom, relatedBy: .equal, toItem: newsImage, attribute: .bottom, multiplier: 1, constant: -8))
        addConstraint(NSLayoutConstraint(item: comments, attribute: .right, relatedBy: .equal, toItem: newsImage, attribute: .right, multiplier: 1, constant: 0))
        addContraintsWithVisualFormat("V:[v0(20)]", [comments])
        addContraintsWithVisualFormat("H:[v0]", [comments])
        
        addConstraint(NSLayoutConstraint(item: titleOfNews, attribute: .left, relatedBy: .equal, toItem: newsImage, attribute: .left, multiplier: 1, constant: 16))
        addConstraint(NSLayoutConstraint(item: titleOfNews, attribute: .bottom, relatedBy: .equal, toItem: comments, attribute: .top, multiplier: 1, constant: -4))
        addConstraint(NSLayoutConstraint(item: titleOfNews, attribute: .right, relatedBy: .equal, toItem: newsImage, attribute: .right, multiplier: 1, constant: 0))
        addContraintsWithVisualFormat("V:[v0(20)]", [titleOfNews])
        addContraintsWithVisualFormat("H:[v0]", [titleOfNews])
        
        titleOfNews.font = UIFont.boldSystemFont(ofSize: self.bounds.height/2)
        comments.font = UIFont.systemFont(ofSize: self.bounds.height/3)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
