//
//  HistoryViewController.swift
//  MapTask
//
//  Created by Nazhmeddin Babakhanov on 3/16/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
import Cartography

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var delegate:talkDelegate?
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = true
        tableView.bounces=false
        tableView.showsVerticalScrollIndicator=false
        tableView.alwaysBounceVertical = true
        return tableView
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cellId")
        view.addSubview(tableView)
        addConstraints()
        
    }
    
   
    private func addConstraints() {
        
        constrain(view, tableView){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height
            v2.center == v1.center
            
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (delegate?.places.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomCell
       
        //cell.detailTextLabel?.text = delegate?.places[indexPath.row].subtitle
       
//        let todaysDate:NSDate = (delegate?.places[indexPath.row].currentData)!
//        let dateFormatter:DateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
//        let DateInFormat:String = dateFormatter.string(from: todaysDate as Date)
   
        cell.label.text = "1234"
        cell.label1.text = "1234"
        //cell.textLabel?.text = (delegate?.places[indexPath.row].title)! +  "/t\(DateInFormat)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delegate?.places.remove(at: indexPath.row)
            delegate?.MapView.removeAnnotation((delegate?.MapView.annotations[indexPath.row])!)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
}

class CustomCell: UITableViewCell {
    
    var label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Nolan"
        return label
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont.systemFont(ofSize: 20.0)
        label.text = "Nolan"
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setupView()
       
    }
    
    func setupView(){
        addSubview(label1)
        addSubview(label)
        constrain(label1,label){l1,l in
            l1.height == (l1.superview?.width)!/9
            l1.top == (l1.superview?.top)!
            l1.left == (l1.superview?.left)! + 30
            
            l.height == l1.height
            l.centerY == l1.centerY
            
            distribute(by: 5, vertically: l1,l)
            
        
        }
        self.accessoryType = .disclosureIndicator
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


