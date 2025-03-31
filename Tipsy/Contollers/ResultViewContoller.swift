//
//  ResultsViewContoller.swift
//  Tipsy
//
//  Created by Kush Singhy on 29/3/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewContoller: UIViewController {
    var totalAmount: String?
    var tipPercentage: Double?
    var splitNumber: Double?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formattedTip = Int((tipPercentage ?? 0) * 100)

        totalLabel.text = totalAmount!
        settingsLabel.text = "Split between \(Int(splitNumber ?? 1)) people, with \(formattedTip)% tip."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }


}
