//
//  TaxedIncomeViewController.swift
//  CalculatorYearlyPay
//
//  Created by ALIA M NEELY on 6/26/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit


class TaxedIncomeViewController: UIViewController {
    
    @IBOutlet weak var americanImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        americanImage.image = #imageLiteral(resourceName: "AmericanEagle").alpha(0.9)
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    var isSalary = false
    
    @IBOutlet weak var houlryRateTextField: UITextField!
    @IBOutlet weak var moneyAfterTaxesLabel: UILabel!
    @IBOutlet weak var salaryButtonLabel: UIButton!
    @IBOutlet weak var moneyOwed: UILabel!
    
    
    @IBAction func salaryHourlyButtonTapped(_ sender: Any) {
        if isSalary == false {
            isSalary = true
            self.houlryRateTextField.placeholder = "Enter Years Salary..."
            self.salaryButtonLabel.setTitle("Salary", for: .normal)
            return
        }
        if isSalary == true {
            isSalary = false
            self.houlryRateTextField.placeholder = "Enter Hourly Rate"
            self.salaryButtonLabel.setTitle("Hourly", for: .normal)
            return
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        if isSalary == false {
            guard let hourlyWage = houlryRateTextField.text else {return}
            guard let wageAsDouble = Double(hourlyWage) else {return}
            let yearlyPay = MoneyController.calculateYearPayByHourly(wage: wageAsDouble)
            let yearTax = MoneyController.calculateTaxByHourly(wage: wageAsDouble)
            moneyAfterTaxesLabel.text = "\(yearlyPay) $ Keep"
            moneyOwed.text = "\(yearTax) $ Owed"
          //  disablesAutomaticKeyboardDismissal = false
                }
        if isSalary == true {
            guard let hourlyWage = houlryRateTextField.text else {return}
            guard let salaryAsDouble = Double(hourlyWage) else {return}
            let yearlyPay = MoneyController.calculateYearlyPayWith(salary: salaryAsDouble)
            let yearTax = MoneyController.calculateTaxAmountWith(salary: salaryAsDouble)
            moneyAfterTaxesLabel.text = "\(yearlyPay) $ Keep"
            moneyOwed.text = "\(yearTax) $ Owed"
           // disablesAutomaticKeyboardDismissal = false
        }
        
    }
    
}
