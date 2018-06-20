//
//  CreateOrConnectViewController.swift
//  SPY
//
//  Created by Nazhmeddin Babakhanov on 4/26/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography

class CreateOrConnectViewController: UIViewController {
    
    // MARK: - Properties
    lazy var viewCreate:UIView = {
        let viewcre = UIView()
        viewcre.backgroundColor = UIColor(red:0.474, green:0.184, blue:0.525, alpha:1)
        viewcre.addGestureRecognizer(gestureForCreate)
        viewcre.isUserInteractionEnabled = true
        return viewcre
    }()
    
    lazy var gestureForCreate:UITapGestureRecognizer = {
        var gesture = UITapGestureRecognizer()
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        gesture.addTarget(self, action: #selector(createGestureAction))
        return gesture
    }()
    
    lazy var createLabel:UILabel = {
        let createlbl = UILabel()
        createlbl.text = "Create a group"
        createlbl.textColor = .white
        createlbl.font = UIFont.systemFont(ofSize: view.bounds.width/12)
        createlbl.textAlignment = .center
        return createlbl
    }()
    
    lazy var viewConnect:UIView = {
        let viewcon = UIView()
        viewcon.backgroundColor = UIColor(red:0.513, green:0.839, blue:0.392, alpha:1)
        viewcon.addGestureRecognizer(gestureForConnect)
        return viewcon
    }()
    
    lazy var gestureForConnect:UITapGestureRecognizer = {
        var gesture = UITapGestureRecognizer()
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        gesture.addTarget(self, action: #selector(ConnectGestureAction))
        return gesture
    }()
    
    lazy var connectLabel:UILabel = {
        let createlbl = UILabel()
        createlbl.text = "Connect"
        createlbl.font = UIFont.systemFont(ofSize: view.bounds.width/12)
        createlbl.textAlignment = .center
        createlbl.textColor = .white
        return createlbl
    }()
    
    lazy var buttonBack:UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "backArrow"), for: .normal)
        button.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Initial Setup
    func setupViews(){
       
        self.viewConnect.addSubview(connectLabel)
        self.view.addSubview(viewConnect)
        self.viewCreate.addSubview(createLabel)
        self.view.addSubview(viewCreate)
        self.view.addSubview(buttonBack)
    }
    
    // MARK: - Constraints
    func setupConstaints(){
        
        constrain(viewConnect,viewCreate,buttonBack){viewConnect,viewCreate,buttonBack in
            viewCreate.width == viewConnect.width
            viewCreate.height == viewConnect.height
            viewCreate.top == viewConnect.superview!.top
            
            viewConnect.width == viewConnect.superview!.width
            viewConnect.height == viewConnect.superview!.height/2
            viewConnect.top == viewCreate.bottom
            
            buttonBack.width == buttonBack.superview!.width/10
            buttonBack.height == buttonBack.superview!.width/10
            buttonBack.top == buttonBack.superview!.top  + self.view.bounds.width/15
            buttonBack.left == buttonBack.superview!.left
            
        }
        
        constrain(connectLabel,createLabel){ connectL,create in
            create.width == create.superview!.width/1.3
            create.height == create.superview!.width/10
            create.center == create.superview!.center
            
            connectL.width == create.width
            connectL.height == create.height
            connectL.center == connectL.superview!.center
        }
    }
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstaints()
        // Do any additional setup after loading the view.
    }

    // MARK: - Helper mothods
    @objc func backButtonAction(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func ConnectGestureAction(){
        print("connect")
        self.present(ConnectionWithGroupNumberViewController(), animated: false, completion: nil)
    }
    
    @objc func createGestureAction(){
        print("create")
        
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
