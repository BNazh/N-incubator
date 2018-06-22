//
//  ViewController.swift


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zero: RoundedButton!
    override func viewDidLoad(){
        myDisplay.isUserInteractionEnabled = true
        
    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        if UIDevice.current.orientation.isLandscape {
            let storyboard = UIStoryboard(name: "Landscape", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Landscape") as UIViewController
            present(vc, animated: false, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainController") as UIViewController
            present(vc, animated: false, completion: nil)
        }
    }
    var san:Int = 0
    @IBOutlet weak var myDisplay: UILabel!
    var typing : Bool = false
    
    private var mymodel = CalculatorModel()
    @IBAction func digitPressed(_ sender: UIButton) {
        
        mymodel.bol = true
        if  (myDisplay.text!).count<9 {
            if typing{
                let current_display = myDisplay.text!
                let current_title_of_button = sender.currentTitle!
                    if sender.tag == 7 || current_display.contains("."){
                        if current_display == "0"{
                                myDisplay.text = "0."
                        }
                        else if current_display.contains(".") && current_title_of_button == "."{
                            myDisplay.text = current_display
                        }
                        else{
                            myDisplay.text = current_display + current_title_of_button
                        }
                        
                    }
                    else if round(Double(current_display + current_title_of_button)!) == Double(current_display + current_title_of_button) {
                                myDisplay.text = String(describing: Int(current_display + current_title_of_button)!)
                    }
                    else{
                        myDisplay.text = current_display + current_title_of_button
                    }
            
            }else{
                myDisplay.text = sender.currentTitle!
                typing = true
            }
        }
    }
    var displayValue: Double
    {
        
        get{
            return Double(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue)
        }
    }
    var displayValue1: Int
    {
        get{
            
            return Int(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue)
        }
    }
    @IBAction func swipeer(_ sender: UISwipeGestureRecognizer) {
                if (myDisplay.text!).count > 1{
                    (myDisplay.text!).remove(at:(myDisplay.text!).index(before: (myDisplay.text!).endIndex))
                }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
        if typing{
            if mymodel.bol{
                mymodel.setOperand(Double(myDisplay.text!)!)
            }
            else{
                mymodel.setOperand(0)
            }
            typing = false
        }
        mymodel.performOperation(sender.currentTitle!)
        if mymodel.result != nil{
            if round(Double(mymodel.result!)) == Double(mymodel.result!) {
                displayValue1 =  Int(mymodel.result!)
            }
            else{
                displayValue = mymodel.result!
            }
        }
        
//        typing = true
//        if mymodel.bol{
//            mymodel.setOperand(Double(myDisplay.text!)!)
//        }
//        else{
//           mymodel.setOperand(0)
//        }
//        mymodel.performOperation(sender.currentTitle!)
//        if mymodel.result != nil {
//            myDisplay.text = String(describing: mymodel.result!)
//        }
        
    }
    
    @IBAction func resultLabelChanger(_ sender: RoundedButton) {
        if let result = mymodel.result{
            if round(Double(result)) == Double(result) {
                displayValue1 =  Int(result)
            }
            else{
                displayValue = result
            }
        }

    }
    
}

