//
//  MasterTableViewController.swift
//  Brow
//
//  Created by Nazhmeddin Babakhanov on 2/14/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
protocol UICustomViewDelegate{
    var websites:[Int:[Website]] {set get}
}
class MasterTableViewController: UITableViewController, UICustomViewDelegate{
    var type = 0
    var delegate:UICustomViewDelegate?
    var websites: [Int:[Website]] = [
        0: [Website.init("Google","https://google.com", false,""),Website.init("Intagram","https://instagram.com", false,""), Website.init("VK","https://vk.com", false,""),Website.init("Facebook","https://facebook.com", false,"") ],
        1:[],
        2:[]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
       // ReseveSavingUserdefaults(webs: websites)
       // print("istedi")
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    @IBAction func segmentCont(_ sender: UISegmentedControl) {
        type = sender.selectedSegmentIndex
        print("3")
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites[type]!.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomViewCell
        if delegate?.websites != nil && type != 0{
            cell.RowName.text = delegate?.websites[type]![indexPath.row].Name
            cell.time.text = delegate?.websites[type]![indexPath.row].Time
        }
        else{
            cell.RowName.text = websites[type]![indexPath.row].Name
            cell.time.text = websites[type]![indexPath.row].Time
        }
        return cell
    }
    @IBAction func AddingWebPage(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add website", message: "Fill all the fields", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            let title = alertController.textFields?[0].text
            let url = alertController.textFields?[1].text
            if (title?.count)! > 0 && (url?.count)! > 0 {
                self.websites[0]!.append(Website.init(title!, url!, false, ""))
                self.tableView.reloadData()
            }
        }
        tableView.reloadData()
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Website"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter url"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            websites[type]!.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            if let navdest = segue.destination as? UINavigationController{
                if let destination = navdest.visibleViewController as? DetailViewController{
                    destination.OneWebsite = websites[type]![(tableView.indexPathForSelectedRow?.row)!]
                    destination.websites = self
                    destination.index = tableView.indexPathForSelectedRow?.row
                    destination.getuteIndex = type
                    var adder = websites[type]![(tableView.indexPathForSelectedRow?.row)!]
                    adder.Time = getData()
                    websites[2]?.append(adder)
                    tableView.reloadData()
                }
            }
        }
    }
    func SaveUserdefaults(webs: [Int:[Website]]){
        websites = UserDefaults.standard.object(forKey: "Massive") as! [Int:[Website]]
    }
    func ReseveSavingUserdefaults(webs: [Int:[Website]]){
        UserDefaults.standard.set(webs, forKey: "Massive")
    }
    
    func getData()->String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        return formatter.string(from: currentDateTime)
    }
}
