//
//  DetailViewController.swift
//  Brow
//
//  Created by Nazhmeddin Babakhanov on 2/14/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController,UIWebViewDelegate {
    var websites: UICustomViewDelegate?
    @IBOutlet weak var webPage: UIWebView!
    var OneWebsite:Website?
    var index:Int?
    var getuteIndex:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nonOptionalWebsite = OneWebsite{
            let site_url = URL(string: nonOptionalWebsite.Url!)
            webPage.loadRequest(URLRequest(url: site_url!))
            self.navigationItem.title = nonOptionalWebsite.Name
            self.title = nonOptionalWebsite.Name
            if nonOptionalWebsite.IsChecked == true {
                self.view.backgroundColor = UIColor.red
            }
        }
    }
    
    @IBAction func gestureThreeTap(_ sender: UITapGestureRecognizer) {
        if OneWebsite?.IsChecked != true{
            OneWebsite?.IsChecked = true
            websites?.websites[getuteIndex!]?[index!].IsChecked = true
            websites?.websites[1]?.append(OneWebsite!)
            self.view.backgroundColor = UIColor.red
        }
        else{
            websites?.websites[1]?.remove(at: index!)
        }
        
        
    
    }
    
}
