//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Kush Singhy on 31/3/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

struct CalculatorBrain {
    var billAmount: Double = 0.0
    var splitNumber: Double = 0.0
    var tipPercentage: Double = 0.0
    
    func calculateTip() -> String {
        let result = String(format: "%.2f", (billAmount * (1 + tipPercentage)) / splitNumber)
        return result
    }
}
