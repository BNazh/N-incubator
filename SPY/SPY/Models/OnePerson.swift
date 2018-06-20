//
//  OnePerson.swift
//  SPY
//
//  Created by Nazhmeddin Babakhanov on 5/16/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import FirebaseDatabase
struct OnePerson{
    private var content: String?
    private var user_name: String?
    init(_ content: String, _ user_name: String) {
        self.content = content
        self.user_name = user_name
       
    }
    init(snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        content = tweet.value(forKey: "content") as? String
        user_name = tweet.value(forKey: "user_name") as? String
    }
    var Content: String?{
        get{
            return content
        }
    }
    var User_name: String?{
        get{
            return user_name
        }
    }
   
    func toJSONFormat()-> Any{
        return ["content": content,
                "user_name": user_name
        ]
    }
}
