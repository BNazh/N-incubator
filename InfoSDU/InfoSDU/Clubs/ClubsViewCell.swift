//
//  FriendsListCell.swift
//  SocialNetwork
//
//  Created by Babakhanov Nazhmeddin on 19.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit

class ClubsViewCell: UITableViewCell {
    
    let Image: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "car"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    let Name: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textArea: UILabel = {
        let text = UILabel()
        text.text = "Something will be here"
        text.font = UIFont.systemFont(ofSize: 15)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        self.selectionStyle = .none
    }
    
    func setupView(){
        addSubview(Image)
        addSubview(Name)
        addSubview(textArea)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0(\(self.bounds.width/4))]-20-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0" : Image, "v1":Name]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v0(\(self.bounds.width/4))]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":Image]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[v0]-[v1]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":Name,"v1":textArea]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(self.bounds.width/4+28)-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":textArea]))
        Image.layer.cornerRadius = self.bounds.width/8
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
