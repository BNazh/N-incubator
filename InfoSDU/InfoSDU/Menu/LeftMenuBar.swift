//
//  LeftMenuBar.swift
//  SDULive
//
//  Created by Babakhanov Nazhmeddin on 21.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class LeftMenuBar: UIView {
    
    var mainController: MainViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        setupViewsLeftMenuBar()
    }
    
    lazy var mainImage: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "stars_sky_space_car_113629_3840x2160"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    lazy var NewsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1)
        button.addTarget(self, action: #selector(LeftMenuBar.showNewsViewController), for: .touchUpInside)
        button.addTarget(self, action: #selector(LeftMenuBar.changeColorOnButton), for: .touchUpInside)
        button.setTitle("◎  News", for: .normal)
        button.setTitleColor( UIColor(red: 0, green: 0, blue: 0, alpha: 0.8), for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    lazy var GalleryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        button.addTarget(self, action: #selector(LeftMenuBar.showGalleryViewController), for: .touchUpInside)
        button.addTarget(self, action: #selector(LeftMenuBar.changeColorOnButton), for: .touchUpInside)
        button.setTitle("◎  Gallery", for: .normal)
        button.setTitleColor( UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    lazy var FacultyViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        button.addTarget(self, action: #selector(LeftMenuBar.showFacultyViewController), for: .touchUpInside)
        button.addTarget(self, action: #selector(LeftMenuBar.changeColorOnButton), for: .touchUpInside)
        button.setTitle("◎  Faculty", for: .normal)
        button.setTitleColor( UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    lazy var ClubsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        button.addTarget(self, action: #selector(LeftMenuBar.showClubsViewController), for: .touchUpInside)
        button.addTarget(self, action: #selector(LeftMenuBar.changeColorOnButton), for: .touchUpInside)
        button.setTitle("◎  Clubs", for: .normal)
        button.setTitleColor( UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    lazy var AboutUsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        button.addTarget(self, action: #selector(LeftMenuBar.showAboutUsViewController), for: .touchUpInside)
        button.addTarget(self, action: #selector(LeftMenuBar.changeColorOnButton), for: .touchUpInside)
        button.setTitle("◎  About US", for: .normal)
        button.setTitleColor( UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 0)
        return button
    }()
    
    lazy var developer: UILabel = {
        let label = UILabel()
        label.text = "Nurzhan ⚡︎"
        label.font = UIFont(name: "Bradley Hand", size: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
//        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1)
        return label
    }()
    
    func setupViewsLeftMenuBar() {
        
        addSubViews([mainImage, NewsButton, GalleryButton, FacultyViewButton, ClubsButton, AboutUsButton, developer])
        
        constrain(self, mainImage){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height/4
            v2.top == v1.top
            v2.left == v1.left
        }
        
        constrain(mainImage, NewsButton){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.top == v1.bottom 
            v2.left == (v2.superview?.left)!
        }
        
        constrain(NewsButton, GalleryButton){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.top == v1.bottom
            v2.left == (v2.superview?.left)!
        }
        
        constrain(GalleryButton, FacultyViewButton){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.top == v1.bottom
            v2.left == (v2.superview?.left)!
        }
        
        constrain(FacultyViewButton, ClubsButton){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.top == v1.bottom
            v2.left == (v2.superview?.left)!
        }
        
        constrain(ClubsButton, AboutUsButton){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.top == v1.bottom
            v2.left == (v2.superview?.left)!
        }
        
        constrain(self, developer){ v1, v2 in
            v2.width == v1.width
            v2.height == 50
            v2.left == v1.left
            v2.bottom == v1.bottom - 20
        }
        
    }
    
    @objc func showNewsViewController() {
        MainViewController.currentView = NewsView()
        mainController?.viewDidLoad()
        mainController?.hideLeftMenuBar()
    }
    
    @objc func showFacultyViewController() {
        MainViewController.currentView = FacultyView()
        mainController?.viewDidLoad()
        mainController?.hideLeftMenuBar()
    }
    
    @objc func showClubsViewController() {
        MainViewController.currentView = ClubsView()
        mainController?.viewDidLoad()
        mainController?.hideLeftMenuBar()
    }
    
    @objc func showAboutUsViewController() {
        MainViewController.currentView = AboutUs()
        mainController?.viewDidLoad()
        mainController?.hideLeftMenuBar()
    }
    
    @objc func showGalleryViewController() {
        MainViewController.currentView = GalleryView()
        mainController?.viewDidLoad()
        mainController?.hideLeftMenuBar()
    }
    
    @objc func changeColorOnButton(_ sender: UIButton) {
        let buttons = [NewsButton, GalleryButton, FacultyViewButton, ClubsButton, AboutUsButton]
        for i in buttons {
            i.setTitleColor( UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1), for: .normal)
            i.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8)
        }
        sender.setTitleColor(UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.8), for: .normal)
        sender.backgroundColor = UIColor.init(red: 40/255, green: 154/255, blue: 217/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
