//
//  ViewController.swift
//  TableExample
//
//  Created by Stainley A Lebron R on 10/15/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var names = ["Vegetables": ["Tomato", "Potato", "Lettuce"], "Fruits": ["Apple", "Banana"]]
    
    @IBOutlet weak var vegetablesTextField: UITextField!
    
    @IBOutlet weak var fruitTextField: UITextField!    
    
    @IBAction func callTable(_ sender: UIButton) {
        
        if vegetablesTextField.text != "" {
            for (key, _) in names {
                if key == "Vegetables" {
                    names[key]?.append(vegetablesTextField.text!)
                }
            }
            self.vegetablesTextField.text = ""
        }
        
        if fruitTextField.text != "" {
            for (key, _) in names {
                if key == "Fruits" {
                    names[key]?.append(fruitTextField.text!)
                }
            }
            self.fruitTextField.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "studentTable" {
            segue.destination.performSegue(withIdentifier: "studentTable", sender: names)
        }
    
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

