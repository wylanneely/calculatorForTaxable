//
//  FederalTaxesViewController.swift
//  CalculatorYearlyPay
//
//  Created by ALIA M NEELY on 6/27/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class FederalTaxesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupElementConstraints()
    }
    
    //Create Elements
    
    var moneyTextField = UITextField()
    var calculateButton = UIButton()
    var hourOrSalaryButton = UIButton()
    var moneyKeptLabel = UILabel()
    var moneyOwedLabel = UILabel()
    var imageView = UIImageView()
    
    func setupElements() {
        
        moneyTextField.placeholder = "Dollars an hour..."
        hourOrSalaryButton.setTitle(" Per Hour", for: .normal)
        calculateButton.setTitle("Calculate Tax", for: .normal)
        moneyKeptLabel.textColor = .green
        moneyOwedLabel.textColor = .red
        
        
        //Create Button Actions
        
        hourOrSalaryButton.addTarget(self, action: #selector(hourOrSalaryButtonTapped), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        // Add Elements as subviews
        self.view.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "AmericanEagle")
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(moneyTextField)
        self.view.addSubview(calculateButton)
        self.view.addSubview(hourOrSalaryButton)
        self.view.addSubview(moneyKeptLabel)
        self.view.addSubview(moneyOwedLabel)

    }
    
    
    func setupElementConstraints() {
        
        moneyTextField.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        hourOrSalaryButton.translatesAutoresizingMaskIntoConstraints = false
        moneyKeptLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyOwedLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        //Contraints
        let imageViewLeading = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal,
                                                  toItem: self.view, attribute: .leading, multiplier: 1, constant: 0)
        let imageViewTrailing = NSLayoutConstraint(item: imageView, attribute:.trailing , relatedBy: .equal,
                                                  toItem: self.view, attribute:.trailing, multiplier: 1, constant: 0)
        let imageViewTop = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal,
                                                  toItem: self.view, attribute: .top, multiplier: 1, constant: 0)
        let imageViewBottom = NSLayoutConstraint(item: imageView, attribute: .bottom , relatedBy: .equal,
                                                  toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0)
        
        self.view.addConstraints([imageViewLeading,imageViewTrailing,imageViewTop,imageViewBottom])
        
        
        let moneyTextHeightPosition = NSLayoutConstraint(item: moneyTextField, attribute: .top, relatedBy: .equal,
                                                   toItem: self.view, attribute: .centerY, multiplier: 0.25, constant: 0)
        let moneyTextLeading = NSLayoutConstraint(item: moneyTextField, attribute: .centerX , relatedBy: .equal,
                                                  toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraints([moneyTextHeightPosition,moneyTextLeading])
        
        let hourOrSalaryButtonHeight = NSLayoutConstraint(item: hourOrSalaryButton, attribute: .top, relatedBy: .equal,
                                                          toItem: self.view, attribute: .centerY, multiplier: 0.23, constant: 0)
        let hourOrSalaryLeading = NSLayoutConstraint(item: hourOrSalaryButton, attribute: .left, relatedBy: .equal,
                                                     toItem: moneyTextField, attribute: .right , multiplier: 1, constant: 10)
        self.view.addConstraints([hourOrSalaryButtonHeight,hourOrSalaryLeading])
        
        let calculateButtonHeight = NSLayoutConstraint(item: calculateButton, attribute: .top, relatedBy: .equal,
                                                       toItem: moneyTextField, attribute: .centerY, multiplier: 1, constant: 10)
        let calculateButtonLeading = NSLayoutConstraint(item: calculateButton, attribute: .centerX , relatedBy: .equal,
                                                       toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        
        self.view.addConstraints([calculateButtonHeight,calculateButtonLeading])
        
        let moneyKeptHeight = NSLayoutConstraint(item: moneyKeptLabel, attribute: .top, relatedBy: .equal,
                                                 toItem: self.view, attribute: .centerY, multiplier: 0.9, constant: 0)
        let moneyKeptLeading = NSLayoutConstraint(item: moneyKeptLabel, attribute: .centerX , relatedBy: .equal,
                                                  toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraints([moneyKeptHeight,moneyKeptLeading])
        
        let moneyOwedHeight = NSLayoutConstraint(item: moneyOwedLabel, attribute: .top, relatedBy: .equal,
                                                 toItem: self.view, attribute: .centerY, multiplier: 1.7, constant: 0)
        let moneyOwedLeading = NSLayoutConstraint(item: moneyOwedLabel, attribute: .centerX , relatedBy: .equal,
                                                  toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraints([moneyOwedHeight,moneyOwedLeading])
        

        
    }

    
    
    
    
    //Functions
    var isSalary = false

    func hourOrSalaryButtonTapped() {
        if isSalary == false {
            isSalary = true
            self.moneyTextField.placeholder = "Enter Years Salary..."
            self.hourOrSalaryButton.setTitle("Salary", for: .normal)
            return
        }
        if isSalary == true {
            isSalary = false
            self.moneyTextField.placeholder = "Enter Hourly Rate.."
            self.hourOrSalaryButton.setTitle("Hourly", for: .normal)
            return
        }
    }
    func calculateButtonTapped(){
        if isSalary == false {
            guard let hourlyWage = moneyTextField.text else {return}
            guard let wageAsDouble = Double(hourlyWage) else {return}
            let yearlyPay = MoneyController.calculateYearPayByHourly(wage: wageAsDouble)
            let yearTax = MoneyController.calculateTaxByHourly(wage: wageAsDouble)
            moneyKeptLabel.text = "\(yearlyPay) $ Keep"
            moneyOwedLabel.text = "\(yearTax) $ Owed"
            disablesAutomaticKeyboardDismissal = false
        }
        if isSalary == true {
            guard let hourlyWage = moneyTextField.text else {return}
            guard let salaryAsDouble = Double(hourlyWage) else {return}
            let yearlyPay = MoneyController.calculateYearlyPayWith(salary: salaryAsDouble)
            let yearTax = MoneyController.calculateTaxAmountWith(salary: salaryAsDouble)
            moneyKeptLabel.text = "\(yearlyPay) $ Keep"
            moneyOwedLabel.text = "\(yearTax) $ Owed"
            disablesAutomaticKeyboardDismissal = false
    }
    }
   

}
