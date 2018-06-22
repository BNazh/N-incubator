//
//  MyTableViewController.swift
//  TableViewSeque
//
//  Created by Nazhmeddin Babakhanov on 1/31/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController,UISearchBarDelegate {
    var emptyLabel:UILabel?
    @IBOutlet weak var searchBar:UISearchBar!
    var isSearching = false
    var filteredData = [Fruit]()
    public var fruits: [Fruit] = [
        Fruit.init(fruit_image: UIImage.init(named: "male")!, fruit_name: "DDD", fruit_number: "98235235"),
        Fruit.init(fruit_image: UIImage.init(named: "female")!, fruit_name: "AAA",fruit_number: "9823523511"),
        Fruit.init(fruit_image: UIImage.init(named: "male")!, fruit_name: "BBB",fruit_number: "9823523522"),
        Fruit.init(fruit_image: UIImage.init(named: "female")!, fruit_name: "CCC",fruit_number: "9823523533")
        
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isSearching{
            return filteredData.count
        }
        if fruits.count == 0{
            
            emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
            //(frame: CGRect(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
            emptyLabel?.text = "No Contacts"
            emptyLabel?.textAlignment = NSTextAlignment.center
            self.tableView.backgroundView = emptyLabel
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
            emptyLabel?.isHidden = false
            return 0
        }
        else{
           emptyLabel?.isHidden = true
           return fruits.count
        }
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData.removeAll()
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        }
        else{
            isSearching = true
            for value in fruits {
                if ((value.Fruit_name)?.contains(searchBar.text!))! || (value.Fruit_number?.contains(searchBar.text!))! {
                    filteredData.append(value)
                }
            }
            let mySet = Set(filteredData)
            filteredData = Array(mySet)
            print(filteredData)
            
            tableView.reloadData()
        }
    }

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "mySegue", sender: self)
//    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCellTableViewCell
        if isSearching{
            cell.fruit_lbl.text =  filteredData[indexPath.row].Fruit_name
            cell.fruit_number.text = filteredData[indexPath.row].Fruit_number
            cell.fruit_imageView.image = filteredData[indexPath.row].Fruit_image
        }
        else{
            cell.fruit_lbl.text =  fruits[indexPath.row].Fruit_name
            cell.fruit_number.text = fruits[indexPath.row].Fruit_number
            cell.fruit_imageView.image = fruits[indexPath.row].Fruit_image
        }
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //tableView.deleteRows(at: [indexPath], with: .fade)
            fruits.remove(at: indexPath.row)
            tableView.reloadData()
            
            
        }
        
    }
    


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let desination = segue.destination as! SecondViewController
            desination.fruit_text = fruits[(tableView.indexPathForSelectedRow?.row)!].Fruit_name!
            desination.fruit_number = fruits[(tableView.indexPathForSelectedRow?.row)!].Fruit_number!
            //desination.fruit_image = fruits[(tableView.indexPathForSelectedRow?.row)!].Fruit_image!
            desination.index = tableView.indexPathForSelectedRow?.row
            desination.contoler = self
        }
        else if segue.identifier == "mySegueAdd" {
            let desination = segue.destination as! AddContact
            desination.contol = self
        }
        tableView.reloadData()
    }
    

}
