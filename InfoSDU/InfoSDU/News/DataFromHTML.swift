//
//  DataFromHTML.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftSoup
import UIKit

class DataFromHTML {
    
    var newsArray = [NewsModel]()
    var ContentString = ""
    private var url = URL(fileURLWithPath: "https://www.sdu.edu.kz")
    
    init() {
//        Alamofire.request("http://www.google.kz")
//            .responseString { response in
//                self.ContentString = response.result.value!
//                do{
//                    let doc = try SwiftSoup.parse(self.ContentString)
//                    do{
//                        for element in try doc.select("img").array(){
//                            try print(element.attr("src"))
//                        }
//                    }
//                }catch{
//
//                }
//        }
        
        print(readFromDocumentsFile(fileName: "File"))
    }
    
    func readFromDocumentsFile(fileName:String) -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let path = documentsPath.appendingPathComponent(fileName)
        let checkValidation = FileManager.default
        var file:String
        
        if checkValidation.fileExists(atPath: path) {
            do{
                try file = NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String
            }catch{
                file = ""
            }
        } else {
            file = ""
        }
        
        return file
    }
}


















