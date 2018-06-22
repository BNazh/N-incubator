//
//  AddContact.swift
//  TableViewSeque
//
//  Created by Nazhmeddin Babakhanov on 2/1/18.
//  Copyright © 2018 Nazhmeddin Babakhanov. All rights reserved.
//

import UIKit
extension String {
    var isNumeric: Bool {
        //guard self.characters.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9","+"]
        return Set(self.characters).isSubset(of: nums)
    }
}
class AddContact: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate  {
    
    @IBOutlet weak var pickerView: UIPickerView!
    var cityField:String?
    let sex = ["male","female"]
    var contol: MyTableViewController?
    var arr:[Fruit] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        cityField = "male"
        // Do any additional setup after loading the view.
        navigationItem.title = "New contact"
    }
    
    @IBOutlet weak var nameFiled: UITextField!
    @IBOutlet weak var numberFiled: UITextField!
    @IBAction func tapOutside(_ sender: UITapGestureRecognizer) {
        nameFiled.resignFirstResponder()
        numberFiled.resignFirstResponder()
    }
    @IBAction func Saving(_ sender: UIButton) {
        
        if numberFiled.text != "" && nameFiled.text != "" && (numberFiled.text?.isNumeric)! {
            contol!.fruits.append( Fruit.init(fruit_image: UIImage.init(named: cityField!)!, fruit_name: nameFiled.text!  , fruit_number: numberFiled.text!))
            contol!.tableView.reloadData()
            navigationController?.popViewController(animated: true)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "typing text Surname or number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: .none ))
            self.present(alert, animated: true, completion: nil)
            contol!.tableView.reloadData()
        }
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sex.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sex[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityField = sex[row]
        
    }
    

   
}
