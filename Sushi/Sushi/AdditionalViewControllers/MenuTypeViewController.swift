//
//  MenuTypeViewController.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 11.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//  Nazhmeddin Babakhanov

import UIKit
import Cartography

class MenuTypeViewController: UIViewController {
    
//    MARK: Properties
    
    private var currentIndex = 0
    
    private var dataArray: [RestaurantModel] = [
        RestaurantModel(#imageLiteral(resourceName: "sushi2-1"), "Manga Sushi asfjhasd", "320", "1000$"),
        RestaurantModel(#imageLiteral(resourceName: "sushi33"), "Manga Sushi asdfjhasd", "320", "1000$"),
        RestaurantModel(#imageLiteral(resourceName: "sushi"), "Manga Sushi asdnf asjx", "320", "1000$"),
        RestaurantModel(#imageLiteral(resourceName: "sushi2-1"), "Manga Sushi asjdcna j", "320", "1000$")
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTypeTableViewCell.self, forCellReuseIdentifier: Constants.menuTypeCellIdentifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
//    MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addCustomConstraints()
        
    }
    
    private func setupViews() {
        
        view.addSubViews(views: [tableView])
        
    }
    
//    MARK: Constraints
    private func addCustomConstraints() {
        
        constrain(view, tableView) { view, tableView in
            tableView.width == view.width
            tableView.height == view.height
            tableView.center == view.center
        }
        
    }
    
    
}

extension MenuTypeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.menuTypeCellIdentifier, for: indexPath) as! MenuTypeTableViewCell
        
        cell.foodImage.image = dataArray[indexPath.item].image
        cell.foodTitle.text = dataArray[indexPath.item].title
        cell.foodMass.text = dataArray[indexPath.item].mass
        cell.foodPrice.text = dataArray[indexPath.item].price
        
        cell.addBlackGradientLayer(frame: cell.bounds)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
