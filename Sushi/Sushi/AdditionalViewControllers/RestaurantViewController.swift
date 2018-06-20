//
//  RestaurantViewController.swift
//  Manga-Sushi
//
//  Created by NURZHAN on 10.04.2018.
//  Copyright © 2018 NURZHAN. All rights reserved.
//

import UIKit
import ZKCarousel
import Cartography

class RestaurantViewController: UIViewController {
    
//    MARK: Properties
    
    private let dataArray: [String] = [
        "Время работы ресторана", "ежедневно, \nс 10:00 до 24:00 ",
        "Время работы ресторана", "ежедневно, \nс 10:00 до 24:00 ",
        "Время работы ресторана", "ежедневно, \nс 10:00 до 24:00 "
    ]
    
    lazy var carousel: ZKCarousel = {
        let carousel = ZKCarousel()
        let slide1 = ZKCarouselSlide(image: #imageLiteral(resourceName: "sushi3"), title: "", description: "")
        carousel.slides = [slide1, slide1, slide1]
        return carousel
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RestaurantInfoCell.self, forCellReuseIdentifier: Constants.restaurantInfoCellIdentifier)
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    
//    MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        addConstraints()
        
    }
    
    private func setupViews() {
        
        view.addSubViews(views: [carousel, tableView])
        
    }
    
//    MARK: Constraints
    private func addConstraints() {
        
        constrain(view, carousel, tableView) { view, carousel, tableView in
            carousel.height == view.height * 0.4
            carousel.width == view.width
            carousel.top == view.top
            carousel.centerX == view.centerX
            
            tableView.width == carousel.width
            tableView.height == view.height * 0.6
            tableView.top == carousel.bottom
            tableView.centerX == carousel.centerX
        }
        
        
    }
    
}

//    MARK: Table view data source
extension RestaurantViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.restaurantInfoCellIdentifier, for: indexPath) as! RestaurantInfoCell
        
        cell.titleLabel.text = dataArray[2*indexPath.row]
        cell.descriptionLabel.text = dataArray[2*indexPath.row + 1]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

