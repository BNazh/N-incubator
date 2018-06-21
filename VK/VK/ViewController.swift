//
//  ViewController.swift
//  VK
//
//  Created by Nazhmeddin Babakhanov on 3/8/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography
class ViewController: UIViewController {
    
    let LogotipUIImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "vk")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let LogUpButton:UIButton = {
        let button:UIButton = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor(red: 93/255, green: 138/255, blue:188/255 , alpha: 1 ), for: .normal)
        button.titleLabel?.font = UIFont(name: "AmericanTypewriter-Bold" , size: 18)
        button.addTarget(self, action: #selector(ViewController.buttonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    let LogInFacebook:UIButton = {
        let button:UIButton = UIButton()
        button.setImage(#imageLiteral(resourceName: "facebook"), for: UIControlState.normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: -20, bottom: 10, right: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        button.setTitle("Войти через Facebook", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular" , size: 23)
        //button.titleLabel?.center = button.center
        button.titleLabel?.contentMode = UIViewContentMode.scaleAspectFit
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -100, bottom: 0, right: 0)
        button.backgroundColor = UIColor(red:0.31, green:0.469, blue:0.698, alpha:1)
        button.addTarget(self, action: #selector(ViewController.buttonFacebook(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let HaveAccount:UILabel = {
        let label = UILabel()
        label.text = "Уже есть аккаунт?"
        label.font = UIFont(name: "AppleSDGothicNeo-Thin" , size: 20)
        label.textColor = UIColor(red:0.734, green:0.81, blue:0.914, alpha:1)
        label.textAlignment = .center
        return label
    }()
    
    let LogInButton:UIButton = {
        let button = UIButton()
        button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Regular" , size: 23)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = UIColor(red:0.314, green:0.47, blue:0.677, alpha:1)
        button.addTarget(self, action: #selector(ViewController.buttonSiginIn(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor  = UIColor(red: 93/255, green: 138/255, blue:188/255 , alpha: 1 )
        setupAllAddView()
        setupConstains()
        
    }
    
    func setupAllAddView(){
        view.addSubview(LogotipUIImageView)
        view.addSubview(LogUpButton)
        view.addSubview(LogInFacebook)
        view.addSubview(HaveAccount)
        view.addSubview(LogInButton)
        
    }
    func setupConstains(){
        constrain(LogotipUIImageView,LogUpButton,LogInFacebook,HaveAccount,LogInButton){ LogotipUIImageView,LogUpButton,LogInFacebook,HaveAccount,LogInButton in
            LogotipUIImageView.width ==  view.bounds.width / 2.5
            LogotipUIImageView.height ==  view.bounds.width / 2.5
            LogotipUIImageView.centerX == (LogotipUIImageView.superview?.centerX)!
            LogotipUIImageView.top ==  (LogotipUIImageView.superview?.top)! +  self.view.bounds.height/6
            
            LogUpButton.centerX == (LogUpButton.superview?.centerX)!
            LogUpButton.width == (LogUpButton.superview?.width)! - self.view.bounds.width/7
            LogUpButton.height == self.view.bounds.width/7.5
            LogUpButton.top == (LogotipUIImageView.superview?.centerY)! + self.view.bounds.height / 44
            
            LogInFacebook.centerX == (LogUpButton.superview?.centerX)!
            LogInFacebook.width == (LogUpButton.superview?.width)! - self.view.bounds.width/7
            LogInFacebook.height == self.view.bounds.width/7.5
            
            
            HaveAccount.centerX == (LogUpButton.superview?.centerX)!
            HaveAccount.width == (HaveAccount.superview?.width)! - self.view.bounds.width/7
            HaveAccount.height == self.view.bounds.width/7.5
            
            LogInButton.centerX == (LogUpButton.superview?.centerX)!
            LogInButton.width == (LogInButton.superview?.width)! - self.view.bounds.width/7
            LogInButton.height == self.view.bounds.width/7.5
            
            distribute(by: 20, vertically: LogUpButton, LogInFacebook,HaveAccount,LogInButton)
            
        }
    }
    
    @objc func buttonAction(_ sender:UIButton!){
        self.show(SiginUPViewController(), sender: true)
    }
    
    @objc func buttonFacebook(_ sender:UIButton!){
         UIApplication.shared.open(URL(string: "https://m.facebook.com/v2.10/dialog/oauth?legacy_override=v2.10&display=touch&response_type=token,signed_request&scope=public_profile,user_friends,email,user_birthday&redirect_uri=fb128749580520227://authorize&return_scopes=true&client_id=128749580520227")!, options: [:], completionHandler: nil)
    }
    @objc func buttonSiginIn(_ sender:UIButton!){
        self.show(SiginInViewController(), sender: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    

    


}

