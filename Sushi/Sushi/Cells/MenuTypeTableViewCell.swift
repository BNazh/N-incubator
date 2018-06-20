//
//  MenuTypeTableViewCell.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 11.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//  Nazhmeddin Babakhanov

import UIKit
import Cartography

class MenuTypeTableViewCell: UITableViewCell {
    
//    MARK: Properties
    
    lazy var foodImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "sushi2-1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var foodTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 3
        return label
    }()
    
    lazy var foodMass: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    
    lazy var foodPrice: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var counter: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(showCounter), for: .touchUpInside)
        view.setImage(#imageLiteral(resourceName: "garbage"), for: .normal)
        return view
    }()
    
    lazy var counterCount: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(showCounter), for: .touchUpInside)
        view.setTitle("0", for: .normal)
        return view
    }()
    
    lazy var counterPlus: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(counterChange), for: .touchUpInside)
        view.setTitle("+", for: .normal)
        return view
    }()
    
    lazy var counterMinus: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(counterChange), for: .touchUpInside)
        view.setTitle("-", for: .normal)
        return view
    }()
    
    lazy var counterView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        return view
    }()

//    MARK: Lifecycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        addCustomConstraints()
        
    }
    
    private func setupViews() {
        
        self.addSubViews(views: [foodImage, foodTitle, foodMass, foodPrice, counter, counterView])
        
        counterView.addSubViews(views: [counterPlus, counterMinus, counterCount])
        
        self.selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //    MARK: Constraints
    private func addCustomConstraints() {
        
        constrain(self, foodImage) { view, foodImage in
            foodImage.width == view.width / 2
            foodImage.height == view.height
            foodImage.top == view.top
            foodImage.left == view.left
        }
        
        constrain(foodImage, foodTitle, foodMass, foodPrice) { foodImage, foodTitle, foodMass, foodPrice in
            foodTitle.width == foodImage.width
            foodTitle.top == foodImage.top + self.bounds.height * 0.2
            foodTitle.left == foodImage.right
            
            foodMass.width == foodTitle.width
            foodMass.top == foodTitle.bottom + 5
            foodMass.left == foodTitle.left
            
            foodPrice.width == foodTitle.width
            foodPrice.bottom == foodImage.bottom - self.bounds.height * 0.2
            foodPrice.left == foodMass.left
        }
        
        constrain(self, counter) { view, counter in
            counter.width == view.width / 6
            counter.height == view.height / 3.5
            counter.right == view.right
            counter.bottom == view.bottom
        }
        
        constrain(self, counterView) { view, counterView in
            counterView.width == view.width / 2
            counterView.height == view.height / 3.5
            counterView.left == view.right
            counterView.bottom == view.bottom
        }
        
        constrain(counterView, counterCount, counterMinus, counterPlus) { counterView, counterCount, counterMinus, counterPlus in
            counterMinus.width == counterView.width / 3
            counterMinus.height == counterView.height
            counterMinus.top == counterView.top
            counterMinus.left == counterView.left
            
            counterCount.width == counterView.width / 3
            counterCount.height == counterView.height
            counterCount.top == counterView.top
            counterCount.left == counterMinus.right
            
            counterPlus.width == counterView.width / 3
            counterPlus.height == counterView.height
            counterPlus.top == counterView.top
            counterPlus.left == counterCount.right
        }
    }
    
    var timer = Timer()
    
    @objc private func showCounter() {
        
        UIView.animate(withDuration: 0.3) {
            self.counterView.transform = CGAffineTransform(translationX: -self.bounds.width/2, y: 0)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideCounter), userInfo: nil, repeats: true)
        
    }

    var totalCount = 0
    var checkerCount = 0
    @objc private func counterChange(_ sender: UIButton) {
        if sender.titleLabel?.text == "-" {
            if totalCount > 0{
                totalCount -= 1
            }
        } else {
            totalCount += 1
        }
        counterCount.setTitle(String(totalCount), for: .normal)
        if totalCount != 0 {
            counter.setTitle(String(totalCount), for: .normal)
            counter.setImage(UIImage(), for: .normal)
        }
        
        
    }
    
    @objc private func hideCounter() {
        
        if(totalCount == checkerCount) {
            UIView.animate(withDuration: 0.4, animations: {
                self.counterView.transform = CGAffineTransform.identity
                
            })
        } else {
            checkerCount = totalCount
        }
        
    }
    
}
