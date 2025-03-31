//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    var finalResult: String?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if (sender.currentTitle == zeroPctButton.currentTitle) {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            calculatorBrain.tipPercentage = 0
        } else if (sender.currentTitle == tenPctButton.currentTitle) {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            calculatorBrain.tipPercentage = 0.1
        } else {
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            calculatorBrain.tipPercentage = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        calculatorBrain.splitNumber = Double(splitNumberLabel.text!) ?? 2
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.billAmount = Double(billTextField.text!) ?? 0
        finalResult = calculatorBrain.calculateTip()
        
        performSegue(withIdentifier: "showResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let resultVC = segue.destination as! ResultViewContoller

            resultVC.totalAmount = finalResult
            resultVC.tipPercentage = calculatorBrain.tipPercentage
            resultVC.splitNumber = calculatorBrain.splitNumber
        }
    }
}

