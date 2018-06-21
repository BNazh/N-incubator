//
//  SiginInViewController.swift
//  VK
//
//  Created by Nazhmeddin Babakhanov on 3/9/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography

class SiginInViewController:UIViewController {
    
    let ImageOnCenter:UIImageView = {
        let image : UIImage = #imageLiteral(resourceName: "vk")
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        return imageView
    }()
    
    let RightButtonSiginIn:UIBarButtonItem = {
        let rightAddBarButtonItem = UIBarButtonItem(title: "Войти", style: UIBarButtonItemStyle.plain, target: self,action:#selector(SiginInViewController.addTapped))
        rightAddBarButtonItem.tintColor = UIColor(red:0.734, green:0.81, blue:0.914, alpha:1)
        return rightAddBarButtonItem
    }()
    
    let PostOrTelefonTextFild:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Почта или телефон"
        textField.font = UIFont(name: "HelveticaNeue", size: 20)
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1.0
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 2, 0)
        textField.layer.borderColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor
        return textField
    }()
    let PasswordTextFild:UITextField = {
        let PasswordTextFild = UITextField()
        PasswordTextFild.translatesAutoresizingMaskIntoConstraints = false
        PasswordTextFild.placeholder = "Пороль"
        PasswordTextFild.font = UIFont(name: "HelveticaNeue", size: 20)
        PasswordTextFild.layer.masksToBounds = true
        PasswordTextFild.layer.borderWidth = 1.0
        PasswordTextFild.layer.sublayerTransform = CATransform3DMakeTranslation(10, 2, 0)
        PasswordTextFild.layer.borderColor = UIColor.init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor
        return PasswordTextFild
    }()
    
    let ForgetPassword:UILabel = {
        let label = UILabel()
        label.text = "Забыли пороль?"
        label.font = UIFont(name: "HelveticaNeue", size: 15)
        label.textColor = UIColor(red:0.788, green:0.787, blue:0.808, alpha:1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
//    let LetfButtonBack:UIBarButtonItem = {
//        let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.plain, target: self,action:#selector(SiginInViewController.searchTapped))
//        leftBarButtonItem.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Helvetica", size: 25.0)!], for: UIControlState.normal)
//        leftBarButtonItem.tintColor = .white
//        return leftBarButtonItem
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        setupItems()
        PostOrTelefonTextFild.becomeFirstResponder()
    }
    
    func setupItems(){
        view.addSubview(PostOrTelefonTextFild)
        view.addSubview(PasswordTextFild)
        constrain(PostOrTelefonTextFild,PasswordTextFild){ PostOrTelefonTextFild,PasswordTextFild in
            PostOrTelefonTextFild.centerX == (PostOrTelefonTextFild.superview?.centerX)!
            PostOrTelefonTextFild.width == self.view.bounds.width
            PostOrTelefonTextFild.height == 50
            PostOrTelefonTextFild.top ==  (PostOrTelefonTextFild.superview?.top)! +  self.view.bounds.height/3.3
            
            PasswordTextFild.center == PostOrTelefonTextFild.center
            PasswordTextFild.width == self.view.bounds.width
            PasswordTextFild.height == 50
        
            distribute(by: 10, vertically: PostOrTelefonTextFild, PasswordTextFild)
        }
        view.addSubview(ForgetPassword)
        
        constrain(ForgetPassword){ForgetPassword in
            ForgetPassword.center == (ForgetPassword.superview?.center)!
            ForgetPassword.width == self.view.bounds.width
            ForgetPassword.height == 50
        }
    }
    
    func setNavigationItems(){
        navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = UIColor(red:0.262, green:0.43, blue:0.67, alpha:1)
        self.navigationItem.setRightBarButton(RightButtonSiginIn, animated: true)
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationItem.titleView = ImageOnCenter
        self.navigationItem.titleView = ImageOnCenter
    }
    
    @objc func addTapped (sender:UIButton) {
        print("add pressed")
    }


}
