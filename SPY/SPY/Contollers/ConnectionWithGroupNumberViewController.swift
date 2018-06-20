//
//  ConnectionWithGroupNumberViewController.swift
//  SPY
//
//  Created by Nazhmeddin Babakhanov on 4/27/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography

class ConnectionWithGroupNumberViewController: UIViewController {

    // MARK: - Properties
    lazy var inputGroupNumber:UITextField = {
        let input = UITextField()
        input.placeholder = "Write a group number"
        input.attributedPlaceholder = NSAttributedString(string: input.placeholder! , attributes: [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        input.textColor = .white
        input.font = .systemFont(ofSize: view.bounds.width/14)
        input.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return input
    }()
    
    lazy var lineView:UIView = {
        let line = UIView()
        line.backgroundColor = .black
        return line
    }()
    
    lazy var buttonBack:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonConnect:UIButton = {
        let button = UIButton()
        button.setTitle("Connect", for: .normal)
        button.setTitleColor(UIColor(red:0.435, green:0.356, blue:0.101, alpha:1), for: .normal)
        //button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.513, green:0.839, blue:0.392, alpha:1)
        setupViews()
        setupConstrains()
        setContinueButton(enabled: false)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setupInitial
    func setupViews(){
        self.view.addSubview(lineView)
        self.view.addSubview(inputGroupNumber)
        self.view.addSubview(buttonBack)
        self.view.addSubview(buttonConnect)
    }

    // MARK: - Constraints
    func setupConstrains(){
        constrain(lineView,inputGroupNumber,buttonBack,buttonConnect){ lineView,inputGroupNumber,buttonBack,button in
            inputGroupNumber.width == inputGroupNumber.superview!.width/1.5
            inputGroupNumber.height == inputGroupNumber.superview!.width/10
            inputGroupNumber.center == inputGroupNumber.superview!.center
            
            lineView.centerX  == inputGroupNumber.centerX
            lineView.width == lineView.superview!.width/1.3
            lineView.height == 1
            lineView.top == inputGroupNumber.bottom
            
            buttonBack.width == buttonBack.superview!.width/10
            buttonBack.height == buttonBack.superview!.width/10
            buttonBack.top == buttonBack.superview!.top  + self.view.bounds.width/15
            buttonBack.left == buttonBack.superview!.left
            
            button.width == inputGroupNumber.width/3
            button.height == inputGroupNumber.height
            button.centerX == inputGroupNumber.centerX
            
            distribute(by: self.view.bounds.width/4, vertically: inputGroupNumber,button)
        }
    }
    
    // MARK: - Helper mothods
    @objc func backButtonAction(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func textFieldChanged(_ target:UITextField) {
        let email = inputGroupNumber.text
        let formFilled = email != nil && email != ""
        setContinueButton(enabled: formFilled)
    }
    
    func setContinueButton(enabled:Bool) {
        if enabled {
            buttonConnect.alpha = 1.0
            buttonConnect.isEnabled = true
        } else {
            buttonConnect.alpha = 0
            buttonConnect.isEnabled = false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
