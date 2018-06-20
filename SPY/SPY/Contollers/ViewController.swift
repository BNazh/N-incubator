//
//  ViewController.swift
//  SPY
//
//  Created by Nazhmeddin Babakhanov on 4/26/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography
import FirebaseAuth
import Firebase
import FirebaseDatabase

class ViewController: UIViewController,UITextFieldDelegate {
    
    // MARK: - Properties
    
    lazy var InputText:UITextField = {
        let input = UITextField()
        input.placeholder = "Write your name"
        input.attributedPlaceholder = NSAttributedString(string: input.placeholder! , attributes: [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.8156862745, green: 0.768627451, blue: 0.6196078431, alpha: 1)])
        input.font = .systemFont(ofSize: 25)
        input.delegate = self
        input.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        return input
    }()
    
    lazy var lineView:UIView = {
        let view1 = UIView()
        view1.backgroundColor = .black
        return view1
    }()
    
    lazy var buttonNext:UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(UIColor(red:0.435, green:0.356, blue:0.101, alpha:1), for: .normal)
        button.addTarget(self, action: #selector(ViewController.buttonNextAction), for: .touchUpInside)
        return button
    }()
    
    private var dbRef: DatabaseReference?
    
   
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:1, green:0.972, blue:0.878, alpha:1)
        setupViews()
        setupConstraints()
        setContinueButton(enabled: false)
        
    }
    
    // MARK: - Inital Setup
    func setupViews() {
        [InputText,lineView,buttonNext].forEach { (v1) in
            self.view.addSubview(v1)
        }
    }
    
    // MARK: - Helper methods
    @objc func buttonNextAction(){
        let tweet = OnePerson.init("Hello" ,  InputText.text!)
        self.dbRef?.childByAutoId().setValue(tweet.toJSONFormat())
        self.present(CreateOrConnectViewController(), animated: false, completion: nil)
    }
    
    //        dbRef?.observe(DataEventType.value, with: { (snapshot) in
    //            print(snapshot.childrenCount)
    //            for snap in snapshot.children{
    //                let tweet = OnePerson.init(snapshot: snap as! DataSnapshot)
    //                print(tweet)
    //            }
    //
    //           // self.tweets.reverse()
    //            //self.tableView.reloadData()
    //        })

    @objc func textFieldChanged(_ target:UITextField) {
        let email = InputText.text
        let formFilled = email != nil && email != ""
        setContinueButton(enabled: formFilled)
    }
    
    func setContinueButton(enabled:Bool) {
        if enabled {
            
            buttonNext.alpha = 1.0
            buttonNext.isEnabled = true
        } else {
            buttonNext.alpha = 0
            buttonNext.isEnabled = false
        }
    }
    
    // MARK: - Constraints
    func setupConstraints(){
        dbRef = Database.database().reference()
        dbRef = dbRef?.child("peoples")
        constrain(InputText,lineView,buttonNext){input,line,button in
            input.width == input.superview!.width/2.3
            input.height == input.superview!.width/8
            input.center == input.superview!.center
            
            line.center == input.center
            line.width == line.superview!.width/1.5
            line.height == 1
            
            button.width == input.width/3
            button.height == input.height
            button.centerX == input.centerX
            
            distribute(by: 1, vertically: input,line)
            distribute(by: self.view.bounds.width/4, vertically: input,button)
        }
        
        
        
    }

    


}



