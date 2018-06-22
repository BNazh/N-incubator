//
//  SecondViewController.swift
//  TableViewSeque
//
//  Created by Nazhmeddin Babakhanov on 1/31/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var fruit_text = String()
    var fruit_number = String()
    var index:Int?
    var contoler: MyTableViewController?
    
    @IBOutlet weak var fruit_label: UILabel!
    @IBOutlet weak var Fruit_number: UILabel!
   
    @IBAction func EditText(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Enter details?", message: "Enter your name and surname", preferredStyle: .alert)
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let name = alertController.textFields?[0].text
            let number = alertController.textFields?[1].text
            
            if (number?.isNumeric)! && (name?.count)! > 0 && (number?.count)! > 0 {
                self.fruit_label.text = name
                self.Fruit_number.text = number
                self.contoler?.fruits[self.index!].Fruit_name = name
                self.contoler?.fruits[self.index!].Fruit_number = number
                self.contoler?.tableView.reloadData()
            }
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Number"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
//        let alert = UIAlertController(title: "Edit", message: "Surname or number", preferredStyle: .alert)
//        alert.addTextField { (textField) in
//            textField.text = ""
//        }
//        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
//            let textField = alert?.textFields![0]
//            let a = alert?.textFields![1]
//            print("Text field: \(String(describing: textField?.text)) \(String(describing: a?.text))")
//        }))
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
//        self.present(alert, animated: true, completion: nil)
//        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//
//        self.present(alert, animated: true, completion: nil)
    }
    @IBOutlet weak var Fruit_image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fruit_label.text = fruit_text
        Fruit_number.text = fruit_number
        Fruit_image.image = contoler?.fruits[index!].Fruit_image!
        navigationItem.title = "Contact Info"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Deleted(_ sender: UIButton) {
        contoler?.fruits.remove(at: index!)
        navigationController?.popViewController(animated: true)
        contoler?.tableView.reloadData()
        
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
