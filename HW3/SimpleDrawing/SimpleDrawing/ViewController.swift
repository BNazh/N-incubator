//
//  ViewController.swift
//  SimpleDrawing
//
//  Created by Darkhan on 05.02.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customView.vc = self
    }


    func changeTitle(_ newTitle: String){
        myLabel.text = newTitle
    }
}

