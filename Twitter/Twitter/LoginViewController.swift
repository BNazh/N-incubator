//
//  LoginViewController.swift
//  Twitter
//
//  Created by Nazhmeddin Babakhanov on 13.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import FirebaseAuth

class LoginViewController: UIViewController {
    let twitterColor : UIColor = UIColor(red: 0.176470588235294, green: 0.666666666666667, blue: 0.882352941176471, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
        view.backgroundColor = .white
        setupViews()
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 270, height: 30))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "twitter-1.png")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
    }
    lazy var email_field : UITextField = {
        let f = UITextField()
        f.placeholder = "Эл. почта"
        f.backgroundColor = .white
        f.setBottomBorder()
        f.font = UIFont(name: "Helvetica", size: 14)
        f.tintColor = twitterColor
        f.textColor = twitterColor
        return f
    }()
    lazy var password_field : UITextField = {
        let f = UITextField()
        f.placeholder = "Пароль"
        f.isSecureTextEntry = true
        f.backgroundColor = .white
        f.font = UIFont(name: "Helvetica", size: 14)
        f.tintColor = twitterColor
        f.textColor = twitterColor
        f.setBottomBorder()
        return f
    }()
    lazy var message : UILabel = {
        let l = UILabel()
        l.text = "We have sent you a message. Check your email"
        return l
    }()
    lazy var loginnButton : UIButton = {
        let b = UIButton()
        b.setTitle("Log in", for: .normal)
        b.layer.cornerRadius = 18
        b.backgroundColor = twitterColor
        
        Auth.auth().signIn(withEmail: email_field.text!, password: password_field.text!, completion: { (user, error) in
            if error == nil{
                if (user?.isEmailVerified)!{
                    self.performSegue(withIdentifier: "mySegue2", sender: self)
                }else{
                    self.message.textColor = UIColor.red
                    self.message.text = "Your email is not verified!"
                }
            }else{
                self.message.text = "Error! User is not signed up."
            }
        })
        
        return b
    }()
    func setupViews(){
        view.addSubview(email_field)
        view.addSubview(password_field)
        view.addSubview(loginnButton)
        view.addSubview(message)
        constrain(email_field,password_field,loginnButton){ e,p,b in
            e.centerX == (e.superview?.centerX)!
            e.top == (e.superview?.top)!+100
            e.width == (e.superview?.width)!/1.5
            e.height == 30
            p.centerX == e.centerX
            p.width == e.width
            p.height == e.height
            b.centerX == e.centerX
            b.width == e.width
            b.height == 36
            distribute(by: 5, vertically: e,p)
            distribute(by: 20, vertically: p,b)

        }
    }
}
