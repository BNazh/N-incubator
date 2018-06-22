//
//  Website.swift
//  Brow
//
//  Created by Nazhmeddin Babakhanov on 2/14/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import Foundation
struct Website{
    private var url : String?
    private var isChecked: Bool?
    private var name:String?
    private var time:String?
    init(_ name : String, _ url : String, _ isChecked: Bool, _ time:String) {
        self.isChecked = isChecked
        self.url = url
        self.name = name
        self.time = time
    }
    var Url : String?{
        get{return url}
        
    }
    var IsChecked: Bool?{
        get{return isChecked}
        set{isChecked = newValue}
    }
    var Name: String?{
        get{return name}
        set{name = newValue}
    }
    var Time: String?{
        get{return time}
        set{time = newValue}
    }
    
}
