//
//  MyCell.swift
//  Sushi
//
//  Created by MacBook on 10.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import Cartography

class MyCell: UITableViewCell {
    
    var width:CGFloat = 0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        self.selectionStyle = .none
    }
    
    lazy var Name:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 18)
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    lazy var Price:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 18)
        label.sizeToFit()
        return label
    }()
    
    lazy var Image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var tg:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "blacktg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var hr:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var counter: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(showCounter), for: .touchUpInside)
        view.setImage(#imageLiteral(resourceName: "basket"), for: .normal)
        return view
    }()
    
    lazy var counterCount: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(showCounter), for: .touchUpInside)
        view.setTitle("0", for: .normal)
        view.titleLabel?.font = UIFont(name: "Helvetica", size: 24)
        return view
    }()
    
    lazy var counterPlus: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(counterPlusButton), for: .touchUpInside)
        view.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        return view
    }()
    
    lazy var counterMinus: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        view.addTarget(self, action: #selector(counterMinusButton), for: .touchUpInside)
        view.setImage(#imageLiteral(resourceName: "minus"), for: .normal)
        return view
    }()
    
    lazy var counterView: UIView = {
        let view = UIView()
        view.layer.zPosition = 1
        view.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        self.addViews([Image,counterView,Name,Price,tg,hr,counter])
        self.counterView.addViews([counterPlus, counterMinus, counterCount])
        
        constrain(Image,Name,Price,tg,hr,counterView){Image,Name,Price,tg,hr,counterView in
            Image.centerY == Image.superview!.centerY
            Image.leading == Image.superview!.leading + 13
            Image.width == Image.superview!.width*0.15
            Image.height == Image.superview!.width*0.15
            
            Name.leading == Image.trailing + 7
            Name.centerY == Image.centerY
            Name.width == Name.superview!.width*0.38
            
            tg.centerY == Price.centerY
            tg.trailing == tg.superview!.trailing - self.bounds.width*0.14 - 20
            tg.width == tg.superview!.width*0.027
            tg.height == tg.superview!.width*0.028
            
            Price.centerY == Name.centerY
            Price.trailing == tg.leading - 7
            
            hr.height == 1
            hr.leading == Image.leading
            hr.trailing == hr.superview!.trailing
            hr.bottom == hr.superview!.bottom
        }
        
        constrain(self, counterView) { view, counterView in
            counterView.width == view.width*0.4
            counterView.height == view.height
            counterView.left == view.right
            counterView.bottom == view.bottom
        }
        
        constrain(self, counter) { view, counter in
            counter.width == view.width*0.14
            counter.height == view.height
            counter.right == view.right
            counter.bottom == view.bottom
        }
        
        constrain(counterView,counterCount,counterMinus,counterPlus,counter) {counterView,counterCount, counterMinus, counterPlus,counter in
            counterMinus.width == counter.height*0.3
            counterMinus.height == counter.height*0.3
            counterMinus.centerY == counter.centerY
            counterMinus.left == counterView.left + 10
            
            counterCount.width == counter.width
            counterCount.height == counter.height
            counterCount.top == counter.top
            counterCount.centerX == counterView.centerX
            
            counterPlus.width == counter.height*0.3
            counterPlus.height == counter.height*0.3
            counterPlus.centerY == counter.centerY
            counterPlus.trailing == counterView.trailing - 10
        }
    }
    
    @objc private func showCounter() {
        UIView.animate(withDuration: 0.3) {
            self.counterView.transform = CGAffineTransform(translationX: -self.bounds.width*0.4, y: 0)
            self.counter.alpha = 0
        }
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideCounter), userInfo: nil, repeats: true)
    }
    
    var totalCount = 0
    var checkerCount = 0
    
    @objc func counterPlusButton() {
        totalCount += 1
        counterCount.setTitle(String(totalCount), for: .normal)
        counter.setTitle(String(totalCount), for: .normal)
        counter.setImage(UIImage(), for: .normal)
    }
    
    @objc func counterMinusButton() {
        if totalCount > 0{
            totalCount -= 1
        }
        counterCount.setTitle(String(totalCount), for: .normal)
        if totalCount != 0 {
            counter.setTitle(String(totalCount), for: .normal)
            counter.setImage(UIImage(), for: .normal)
        }else{
            counter.setTitle("", for: .normal)
            counter.setImage(#imageLiteral(resourceName: "basket"), for: .normal)
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
        self.counter.alpha = 1
    }
    
}
