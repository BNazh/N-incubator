//
//  RoundedButton.swift
//  CalcWithMVC
//
//  Created by Nazhmeddin Babakhanov on 1/23/18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    
    @IBInspectable var roundButton:Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
    
}

