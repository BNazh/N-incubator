//
//  BasketViewController.swift
//  Sushi
//
//  Created by MacBook on 10.04.2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import Cartography
class BasketViewController: UIViewController {

    // MARK: - Properties
    var array:[Sushi] = [Sushi.init(image: "sushi", name: "Hashiuma Toli", price: "2300", amount: "1"),Sushi.init(image: "sushi", name: "Hashiuma Toli", price: "2300", amount: "1")]
    
    var index:Int = 0
    var isClicked:Bool = false
    
    lazy var tableView:UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.register(MyCell.self, forCellReuseIdentifier: "myCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var Order:UIButton = {
        let button = UIButton()
        button.setTitle("Оформить заказ", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.4419322212, blue: 0, alpha: 1)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(orderedZakaz), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var emptyView:UIView = {
       let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emptyBasket:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "emptyBasket")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var emptyLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 30)
        label.numberOfLines = 2
        label.text = "Корзина пока еще пуста"
        return label
    }()
    
    lazy var toMenu:UIButton = {
        let label = UIButton()
        label.setTitle("Посмотреть меню", for: .normal)
        label.setTitleColor(#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), for: .normal)
        label.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addTarget(self, action: #selector(toMenuAction), for: .touchUpInside)
        return label
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        willOrdered()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setUpInitial()
        setUpConstrtrains()
    }

    func willOrdered(){
        if array.count > 0{
            self.navigationItem.title = "2 300 т"
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Очистить", style: .done, target: self, action: #selector(cleanUp))
            tableView.isHidden = false
            emptyView.isHidden = true
            Order.isHidden = false
        }else{
            self.navigationItem.title = "Корзина"
            tableView.isHidden = true
            emptyView.isHidden = false
            Order.isHidden = true
        }
    }
    
    //MARK: - Initaial set up
    func setUpInitial(){
        self.view.addViews([tableView,Order,emptyView])
        self.emptyView.addViews([emptyBasket,emptyLabel,toMenu])
    }
    
    //MARS: - Set up constrins
    func setUpConstrtrains(){
        constrain(tableView,Order,emptyView){tableView,Order,emptyView in
            Order.bottom == Order.superview!.bottom - 2
            Order.width == Order.superview!.width - 40
            Order.height == Order.superview!.width*0.13
            Order.centerX == Order.superview!.centerX
            
            tableView.bottom == Order.top - 3
            tableView.width == tableView.superview!.width
            tableView.top == tableView.superview!.top + (self.navigationController?.navigationBar.frame.height)! + 20
            
            emptyView.bottom == Order.top - 3
            emptyView.width == tableView.superview!.width
            emptyView.top == tableView.superview!.top + (self.navigationController?.navigationBar.frame.height)! + 20
        }
        constrain(emptyBasket,emptyLabel,toMenu){emptyBasket,emptyLabel,toMenu in
            emptyBasket.centerX == emptyBasket.superview!.centerX
            emptyBasket.width == emptyBasket.superview!.width/3
            emptyBasket.height == emptyBasket.superview!.width/3
            emptyBasket.top == emptyBasket.superview!.top + self.view.frame.width/4
            
            emptyLabel.top == emptyBasket.bottom + 30
            emptyLabel.centerX == emptyBasket.centerX
            emptyLabel.width == emptyLabel.width
            
            toMenu.top == emptyLabel.bottom + 40
            toMenu.centerX == emptyLabel.centerX
        }
    }
    //MARKS: - Clean the basket
    @objc func cleanUp(){
        let alert = UIAlertController(title: "MangaSushi", message: "Очищать корзину?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default, handler: { action in
            self.array.removeAll()
            self.tableView.reloadData()
            self.navigationItem.title = "Корзина"
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
            self.Order.isHidden = true
            self.navigationItem.rightBarButtonItem = UIBarButtonItem()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default, handler: { action in
            print("cance")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARKS: - Zakaz oformit
    @objc func orderedZakaz(){
        if Int(array[0].price)! < 2000{
            let alert = UIAlertController(title: "MangaSushi", message: "Минимальная сумма заказа: 2000 т", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default, handler: { action in
            }))
                self.present(alert, animated: true, completion: nil)
            }else{
                self.show(OrderingViewController(), sender: self)
            }
    }
    
    @objc func toMenuAction(){
        self.navigationController?.popViewController(animated: true)
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

// MARK: - UITableViewDelegate, UITableViewDataSource
extension BasketViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
        cell.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cell.Image.image = UIImage(named: "\(array[0].image)")
        cell.Name.text = "\(array[0].name)"
        cell.Price.text = "\(array[0].price)"
//        cell.sumOfOrder.text = "\(array[0].amount)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width*0.18
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "MangaSushi", message: "Удалить товар из корзины?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ок", style: UIAlertActionStyle.default, handler: { action in
            self.array.remove(at: indexPath.row)
            tableView.reloadData()
            if self.array.count == 0{
                tableView.isHidden = true
                self.emptyView.isHidden = false
                self.navigationItem.title = "Корзина"
                tableView.isHidden = true
                self.Order.isHidden = true
                 self.navigationItem.rightBarButtonItem = UIBarButtonItem()
            }
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertActionStyle.default, handler: { action in
            print("cance")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
}
