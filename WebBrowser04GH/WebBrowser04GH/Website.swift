//
//  Website.swift
//  WebBrowser04GH
//
//  Created by Darkhan on 30.01.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
class Website{
    private var url : String?
    private var isChecked: Bool?
    
    init(_ url : String, _ isChecked: Bool) {
        self.isChecked = isChecked
        self.url = url
    }
    var Url : String?{
        get{return url}
        
    }
    var IsChecked: Bool?{
        get{return isChecked}
        set{isChecked = newValue}
    }
    
}
