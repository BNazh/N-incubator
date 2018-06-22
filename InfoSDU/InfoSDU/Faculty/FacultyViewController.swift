//
//  FacultyViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography

class FacultyViewController: UIViewController {
    
    lazy var mainScrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var EngineeringFaculty: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "engfac"))
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var BusinessFaculty: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "busfac"))
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var LawFaculty: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "lawfac"))
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    lazy var EducationFacluty: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "educfac"))
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()

    lazy var facultyImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "programmer"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var businessImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "bus"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var lawImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "law"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var educationImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "educ"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        
        mainScrollView = UIScrollView(frame: self.view.bounds)
        mainScrollView.contentSize = CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height * 1.5)
        view.addSubview(mainScrollView)
        
        mainScrollView.addSubViews([EngineeringFaculty, facultyImage, BusinessFaculty, businessImage, LawFaculty, lawImage, EducationFacluty, educationImage])
        
        addConstraints()
    }
    
    func addConstraints(){
        
        constrain(mainScrollView, EngineeringFaculty){ v1, v2 in
            v2.height == v1.height/3.2
            v2.width == v1.width * 0.6
            v2.top == v1.bottom + 20
            v2.left == v1.left + 20
        }
        
        constrain(EngineeringFaculty, facultyImage){ v1, v2 in
            v2.height == v1.width * 0.3
            v2.width == v1.width * 0.3
            v2.centerY == v1.centerY
            v2.left == v1.right + 30
        }
        
        constrain(EngineeringFaculty, BusinessFaculty){ v1, v2 in
            v2.height == v1.height
            v2.width == v1.width
            v2.top == v1.bottom + 20
        }
        
        constrain(mainScrollView, BusinessFaculty){ v1, v2 in
            v2.right == v1.right + CGFloat(view.bounds.width - 20)
        }
        
        constrain(BusinessFaculty, businessImage){ v1, v2 in
            v2.height == v1.width * 0.3
            v2.width == v1.width * 0.3
            v2.centerY == v1.centerY
            v2.right == v1.left - 30
        }
        
        constrain(BusinessFaculty, LawFaculty){ v1, v2 in
            v2.height == v1.height
            v2.width == v1.width
            v2.top == v1.bottom + 20
        }
        
        constrain(mainScrollView, LawFaculty){ v1, v2 in
            v2.left == v1.left + 20
        }
        
        constrain(LawFaculty, lawImage){ v1, v2 in
            v2.height == v1.width * 0.3
            v2.width == v1.width * 0.3
            v2.centerY == v1.centerY
            v2.left == v1.right + 30
        }
        
        constrain(LawFaculty, EducationFacluty){ v1, v2 in
            v2.height == v1.height
            v2.width == v1.width
            v2.top == v1.bottom + 20
        }
        
        constrain(mainScrollView, EducationFacluty){ v1, v2 in
            v2.right == v1.right + CGFloat(view.bounds.width - 20)
        }
        
        constrain(EducationFacluty, educationImage){ v1, v2 in
            v2.height == v1.width * 0.3
            v2.width == v1.width * 0.3
            v2.centerY == v1.centerY
            v2.right == v1.left - 30
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
