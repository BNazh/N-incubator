//
//  PersonalViewController.swift
//  Sushi
//
//  Created by MacBook on 09.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import  Cartography
import PMAlertController

class PersonalViewController: UIViewController {

    // MARK: - Properties
    lazy var  tableview:UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(PersonalAreaCell.self, forCellReuseIdentifier: PersonalAreaCell.identifier)
        table.separatorStyle = .none
        table.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9254901961, blue: 0.9254901961, alpha: 1)
        return table
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
    }
    
    // MARK: - Inital Set up
    func setUpInital(){
        self.basketView.addViews([basketImage,basketTg,basketSum])
        self.view.addSubview(tableview)
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
        constrain(tableview){ table in
            table.width == (table.superview?.width)!
            table.height == (table.superview?.height)!
            table.top == table.superview!.top
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
extension PersonalViewController:UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonalAreaCell.identifier, for: indexPath) as! PersonalAreaCell
        cell.selectionStyle = .none
        cell.titleLabel.text = Constant.namester[indexPath.row]
        cell.foodImageView.image = UIImage.init(named: Constant.namesImage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.height/10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 ||  indexPath.row == 1{
            let alertVC = PMAlertController(title: "Введите номер телефона", description: "", image: nil, style: .alert)
            
            alertVC.addTextField { (textField) in
                textField?.placeholder = "+777 777 77 77"
            }
            
            alertVC.addAction(PMAlertAction(title: "Получить код", style: .cancel, action: { () -> Void in
                print("Capture action Cancel")
            }))
            
            alertVC.addAction(PMAlertAction(title: "Пропустить", style: .default, action: { () in
                print("Capture action OK")
            }))
            self.present(alertVC, animated: true, completion: nil)
        }
        else{
            self.show(FeedbackController(), sender: self)
        }
    }
}


