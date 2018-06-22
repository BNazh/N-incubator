//
//  Fruit.swift
//  TableViewSeque
//
//  Created by Nazhmeddin Babakhanov on 1/31/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import Foundation
import UIKit
class Fruit:Hashable{
    
    var hashValue: Int
    var a = 0
    static func ==(lhs: Fruit, rhs: Fruit) -> Bool {
       return lhs.Fruit_name == rhs.Fruit_name && lhs.Fruit_number == rhs.Fruit_number
    }
    
    private var fruit_image: UIImage?
    private var fruit_name: String?
    private var fruit_number:String?
    init(fruit_image: UIImage, fruit_name: String, fruit_number: String){
        self.fruit_name = fruit_name
        self.fruit_image = fruit_image
        self.fruit_number = fruit_number
        a = a + 1
        self.hashValue = a
        
    }
    var Fruit_image: UIImage?{
        get{
            return fruit_image
        }
        set{
            fruit_image = newValue
        }
    }
    var Fruit_name: String?{
        get{
            return fruit_name
        }
        set{
            fruit_name = newValue
        }
    }
    var Fruit_number: String?{
        get{
            return fruit_number
        }
        set{
            fruit_number = newValue
        }
    }
}

