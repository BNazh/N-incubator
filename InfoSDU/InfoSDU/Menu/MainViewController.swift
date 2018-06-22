//
//  MainViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 23.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class MainViewController: UIViewController {
    
    static var navController = UINavigationController()
    
    lazy var leftMenuBar: LeftMenuBar = {
        let view = LeftMenuBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        return view
    }()
    
    lazy var outside: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
    
    static var currentView:UIView = NewsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MainViewController.navController = navigationController!
        
        view.backgroundColor = .white
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.isUserInteractionEnabled = true
        logoImageView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(MainViewController.setupLeftMenuBar)))
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        logoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        navigationItem.leftBarButtonItem =  imageItem
        
        view.addSubViews([MainViewController.currentView, leftMenuBar, outside])
        
        navigationItem.title = ""
        
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        
        addConstraints()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.setupLeftMenuBar))
        view.addGestureRecognizer(swipeRight)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.hideLeftMenuBar))
        outside.addGestureRecognizer(tapGesture)

        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.hideLeftMenuBar))
        swipeGesture.direction = .left
        let swipeGestureOutside = UISwipeGestureRecognizer(target: self, action: #selector(MainViewController.hideLeftMenuBar))
        swipeGestureOutside.direction = .left
        outside.addGestureRecognizer(swipeGestureOutside)
        leftMenuBar.addGestureRecognizer(swipeGesture)
        leftMenuBar.mainController = self
    }
    
    @objc func setupLeftMenuBar() {
        UIView.animate(withDuration: 0.5) {
            self.leftMenuBar.frame.origin.x = 0
            self.navigationController?.isNavigationBarHidden = true
            self.leftMenuBar.frame.origin.y = 0
            self.outside.frame.origin.x = self.view.bounds.width/3*2
            self.outside.frame.origin.y = 0
        }
    }
    
    @objc func hideLeftMenuBar() {
        UIView.animate(withDuration: 0.5) {
            self.leftMenuBar.frame.origin.x = -self.view.bounds.width
            self.navigationController?.isNavigationBarHidden = false
            self.leftMenuBar.frame.origin.y = (self.navigationController?.navigationBar.bounds.height)!
            self.outside.frame.origin.x = -self.view.bounds.width/3*2
            self.outside.frame.origin.y = (self.navigationController?.navigationBar.bounds.height)!
        }
    }
    
    func addConstraints() {
        constrain(view, MainViewController.currentView){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height - 60
            v2.centerY == v1.centerY
            v2.top == v1.top + 60
        }
        
        constrain(view, outside){ v1, v2 in
            v2.width == v1.width/3
            v2.right == v1.left
            v2.height == v1.height
            v2.centerY == v1.centerY
        }
        
        constrain(outside, leftMenuBar){ v1, v2 in
            v2.width == v1.width*2
            v2.right == v1.left
            v2.height == v1.height
            v2.centerY == v1.centerY + (self.navigationController?.navigationBar.bounds.height)!
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
