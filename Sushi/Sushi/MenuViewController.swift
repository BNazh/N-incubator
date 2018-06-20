//
//  MenuViewController.swift
//  Sushi
//
//  Created by MacBook on 09.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import Cartography

class MenuViewController: UIViewController {
    
    // MARK: - Properties
    private var dataArray: [RestaurantModel] = [
        RestaurantModel(#imageLiteral(resourceName: "sushi2-1"), "Manga ", "320", "3244"),
        RestaurantModel(#imageLiteral(resourceName: "sushi33"), "Manga ", "320", "3244"),
        RestaurantModel(#imageLiteral(resourceName: "sushi"), "Manga ", "320", "3244")
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: Constants.menuCellIdentifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var basketView:UIButton = {
        let view = UIButton()
        view.addTarget(self, action: #selector(toBasket), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var basketImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "basket")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var basketTg:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "tg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var basketSum:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont(name: "Helvetica-Bold", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInital()
        setUpConstrains()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        toBasketAndTg()
    }
    
    // MARK: - Basket
    func toBasketAndTg(){
        let barButtonItem = UIBarButtonItem(customView: basketView)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc func toBasket(){
        self.show(BasketViewController(), sender: self)
//        self.show(EmptyBasketVC(), sender: self)
    }
    
    // MARK: - Inital Set up
    func setUpInital(){
        self.basketView.addViews([basketImage,basketTg,basketSum])
        self.view.addSubview(tableView)
    }
    
    // MARK: - Constrains
    func setUpConstrains(){
        constrain(basketView,basketImage,basketTg,basketSum){basketView,basketImage,basketTg,basketSum in
            basketView.width == 80
            basketView.height == 44
            
            basketImage.width == basketView.width/3
            basketImage.height == basketView.height*0.5
            basketImage.centerY == basketImage.superview!.centerY
            basketImage.trailing == basketImage.superview!.trailing
            
            basketTg.width == basketImage.width*1.2
            basketTg.height == basketImage.height
            basketTg.centerY == basketTg.superview!.centerY
            basketTg.trailing == basketImage.leading + 2
            
            basketSum.trailing == basketTg.leading + 2
            basketSum.centerY == basketSum.superview!.centerY
        }
        constrain(view, tableView) { view, tableView in
            tableView.width == view.width
            tableView.height == view.height
            tableView.center == view.center
        }
        
    }
    
    // MARK: - Hide Back Button Text
    init() {
        super.init(nibName: nil, bundle: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = UIBarButtonItem(title:" ", style: .plain, target: nil, action: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//    MARK: Table view data source
extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.menuCellIdentifier, for: indexPath) as! MenuTableViewCell
        
        cell.mainImage.image = dataArray[indexPath.row].image
        cell.typeLabel.text = dataArray[indexPath.row].title
        
        let size = CGRect(x: cell.bounds.minX, y: cell.bounds.minY, width: cell.bounds.width, height: cell.bounds.height / 2)
        cell.mainImage.addBlackGradientLayer(frame: size)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MenuTypeViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
