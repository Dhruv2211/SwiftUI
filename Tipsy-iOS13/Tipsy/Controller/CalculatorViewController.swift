//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var split = 2
    var finalAmount = "0.0"
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }*/

    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let amount = sender.currentTitle!
        
        let amountToString = String(amount.dropLast())
        
        let amountToDouble = Double(amountToString)!
        
        tip = amountToDouble / 100
        
        billTextField.endEditing(true)
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        split = Int(sender.value)
        
        splitNumberLabel.text = String(Int(sender.value))
        
       
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let
        
        tip = tip * 100
        
        let billAmount = Double(billTextField.text ?? "") ?? 0
        
        let amount = Double(billAmount + ((tip * billAmount) / 100))
        
        let result = amount / (Double(split))
    
        finalAmount = String(format: "%.2f", result)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
       
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResulltsViewController
            
            destinationVC.result = finalAmount
            destinationVC.tip = Int(tip * 100)
            destinationVC.people = Int(split)
        }
    }
}

