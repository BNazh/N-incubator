//
//  Tweet.swift
//  Twitter
//
//  Created by Nazhmeddin Babakhanov on 12.04.2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import Foundation
import FirebaseDatabase
struct Tweet{
    private var content: String?
    private var user_name: String?
    private var user_surname: String?
    private var user_bday: String?
    private var user_email: String?

    init(_ content: String, _ user_name: String, _ user_surname: String, _ user_bday: String, user_email: String) {
        self.content = content
        self.user_name = user_name
        self.user_surname = user_surname
        self.user_bday = user_bday
        self.user_email = user_email
    }
    init(snapshot: DataSnapshot) {
        let tweet = snapshot.value as! NSDictionary
        content = tweet.value(forKey: "content") as? String
        user_name = tweet.value(forKey: "user_name") as? String
        user_surname = tweet.value(forKey: "user_surname") as? String
        user_bday = tweet.value(forKey: "user_bday") as? String
        user_email = tweet.value(forKey: "user_email") as? String
        
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
    var User_surname: String?{
        get{
            return user_surname
        }
    }
    var User_bday: String?{
        get{
            return user_bday
        }
    }
    var User_email: String?{
        get{
            return user_email
        }
    }
    func toJSONFormat()-> Any{
        return ["content": content,
                "user_name": user_name,
                "user_surname": user_surname,
                "user_bday": user_bday,
                "user_email": user_email
        ]
    }
}
