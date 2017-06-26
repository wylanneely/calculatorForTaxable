//
//  TaxedIncomeViewController.swift
//  CalculatorYearlyPay
//
//  Created by ALIA M NEELY on 6/26/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class TaxedIncomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var houlryRateTextField: UITextField!
    @IBOutlet weak var moneyAfterTaxesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
        
        guard let hourlyWage = houlryRateTextField.text else {return}
        
        guard let wageAsDouble = Double(hourlyWage) else {return}
        
       let yearlyPay = MoneyController.calculateYearlyPayByHourly(wage: wageAsDouble)
        
        moneyAfterTaxesLabel.text = "\(yearlyPay)$"
        
        self.houlryRateTextField.text = ""
        
    }

}
