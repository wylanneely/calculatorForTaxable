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
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    //Create Elements
    
    var moneyTextField = UITextField()
    var calculateButton = UIButton()
    var hourOrSalaryButton = UIButton()
    var moneyKeptLabel = UILabel()
    var moneyOwedLabel = UILabel()
    var imageView = UIImageView()
    var stackView = UIStackView()
    
    func setupElements() {
        
        moneyTextField.placeholder = "Dollars an hour..."
        moneyTextField.layer.cornerRadius = 5.0
        moneyTextField.layer.borderColor = UIColor.darkGray.cgColor
        moneyTextField.layer.borderWidth = 0.5
        moneyTextField.backgroundColor = UIColor.gray
        moneyTextField.textColor = UIColor.white
        moneyTextField.adjustsFontSizeToFitWidth = true
        moneyTextField.keyboardType = .decimalPad
        moneyTextField.placeHolderColor = UIColor.lightText
        
        
        
        hourOrSalaryButton.setTitle(" Hourly", for: .normal)
        hourOrSalaryButton.setTitleColor(.black, for: .normal)
        
        calculateButton.setTitle("Calculate Tax", for: .normal)
        calculateButton.setTitleColor(.black, for: .normal)
        
        moneyKeptLabel.textColor = UIColor(hue: 1.28, saturation: 1.0, brightness: 0.74, alpha: 1.0)
        moneyOwedLabel.textColor = .red
        
        
        
        //Create Button Actions
        
        hourOrSalaryButton.addTarget(self, action: #selector(hourOrSalaryButtonTapped), for: .touchUpInside)
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        // Add Elements as subviews
        self.view.addSubview(imageView)
        imageView.image = #imageLiteral(resourceName: "AmericanEagle").alpha(0.73)
        imageView.contentMode = .scaleAspectFit
        self.view.addSubview(moneyTextField)
        self.view.addSubview(calculateButton)
        self.view.addSubview(hourOrSalaryButton)
        self.view.addSubview(moneyKeptLabel)
        self.view.addSubview(moneyOwedLabel)
        self.view.addSubview(stackView)

    }
    
    
    func setupElementConstraints() {
        
        moneyTextField.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        hourOrSalaryButton.translatesAutoresizingMaskIntoConstraints = false
        moneyKeptLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyOwedLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let moneyKeptHeight = NSLayoutConstraint(item: moneyKeptLabel, attribute: .top, relatedBy: .equal,
                                                 toItem: self.view, attribute: .centerY, multiplier: 1.443, constant: 0)
        self.view.addConstraint(moneyKeptHeight)
        
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
                                                          toItem: self.view, attribute: .centerY, multiplier: 0.25, constant: 0)
        
        let hourOrSalaryLeading = NSLayoutConstraint(item: hourOrSalaryButton, attribute: .leading, relatedBy: .equal,
                                                     toItem: moneyTextField, attribute: .trailing , multiplier: 1, constant: 10)
        self.view.addConstraints([hourOrSalaryButtonHeight,hourOrSalaryLeading])
        
        
        
        let calculateButtonHeight = NSLayoutConstraint(item: calculateButton, attribute: .top, relatedBy: .equal,
                                                       toItem: moneyTextField, attribute: .centerY, multiplier: 1, constant: 10)
        let calculateButtonLeading = NSLayoutConstraint(item: calculateButton, attribute: .centerX , relatedBy: .equal,
                                                       toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraints([calculateButtonHeight,calculateButtonLeading])
        
        
//        let moneyKeptHeight = NSLayoutConstraint(item: moneyKeptLabel, attribute: .top, relatedBy: .equal,
//                                                 toItem: self.view, attribute: .centerY, multiplier: 0.9, constant: 0)
        let moneyOwedHeight = NSLayoutConstraint(item: moneyOwedLabel, attribute: .top, relatedBy: .equal,
                                                 toItem: self.view, attribute: .centerY, multiplier: 1.7, constant: 0)
        self.view.addConstraint(moneyOwedHeight)
        let moneyKeptLeading = NSLayoutConstraint(item: moneyKeptLabel, attribute: .centerX , relatedBy: .equal,
                                                  toItem: self.view, attribute: .centerX, multiplier: 1, constant: 16)
        self.view.addConstraints([moneyKeptLeading])
        
        
        
//        let moneyOwedHeight = NSLayoutConstraint(item: moneyOwedLabel, attribute: .top, relatedBy: .equal,
//                                                 toItem: self.view, attribute: .centerY, multiplier: 1.7, constant: 0)
        let moneyOwedLeading = NSLayoutConstraint(item: moneyOwedLabel, attribute: .centerX , relatedBy: .equal,
                                                  toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraints([moneyOwedLeading])
        

        
    }
    
    
    //Functions
    
    
    var isSalary = false

    func hourOrSalaryButtonTapped() {
        if isSalary == false {
            guard let hourlyWage = moneyTextField.text else {return}
            guard let wageAsDouble = Double(hourlyWage) else {
                moneyTextField.text = ""
                self.moneyTextField.placeholder = "Enter Years Salary..."
                self.hourOrSalaryButton.setTitle("Salary", for: .normal)
                isSalary = true
                return
            }
            let hoursAsSalaryAmount = MoneyController.hoursToSalary(wage: wageAsDouble)
            moneyTextField.text = "\(hoursAsSalaryAmount)"
            self.moneyTextField.placeholder = "Enter Years Salary..."
            self.hourOrSalaryButton.setTitle("Salary", for: .normal)
            isSalary = true
            return
        }
        if isSalary == true {
            guard let salaryWage = moneyTextField.text else {return}
            guard let wageAsDouble = Double(salaryWage) else {
                moneyTextField.text = ""
                self.moneyTextField.placeholder = "Enter Hourly Rate.."
                self.hourOrSalaryButton.setTitle("Hourly", for: .normal)
                isSalary = false
                return}
            
            let salaryAsWageAmount = MoneyController.salaryToHourly(wage: wageAsDouble)
            moneyTextField.text = "\(salaryAsWageAmount)"
            self.moneyTextField.placeholder = "Enter Hourly Rate.."
            self.hourOrSalaryButton.setTitle("Hourly", for: .normal)
            isSalary = false
            return
        }
    }

    var eagleSound = EagleSoundController()

    func calculateButtonTapped(){
        if isSalary == false {
            guard let hourlyWage = moneyTextField.text else {return}
            guard let wageAsDouble = Double(hourlyWage) else {return}
            let yearlyPay = MoneyController.calculateYearPayByHourly(wage: wageAsDouble)
            let yearTax = MoneyController.calculateTaxByHourly(wage: wageAsDouble)
            moneyKeptLabel.text = "\(yearlyPay)$"
            moneyOwedLabel.text = "\(yearTax) $ Owed"
            labelSlideDown(moneyKeptLabel)
            labelSlideUp(moneyOwedLabel)
            eagleSound.playEagleSound()
          //  disablesAutomaticKeyboardDismissal = false
        }
        if isSalary == true {
            guard let salaryWage = moneyTextField.text else {return}
            guard let salaryAsDouble = Double(salaryWage) else {return}
            let yearlyPay = MoneyController.calculateYearlyPayWith(salary: salaryAsDouble)
            let yearTax = MoneyController.calculateTaxAmountWith(salary: salaryAsDouble)
            moneyKeptLabel.text = "\(yearlyPay)$"
            moneyOwedLabel.text = "\(yearTax) $ Owed"
            labelSlideDown(moneyKeptLabel)
            labelSlideUp(moneyOwedLabel)
            eagleSound.playEagleSound()
         //   disablesAutomaticKeyboardDismissal = false
    }
        self.resignFirstResponder()
}
    
    
    
    func labelSlideDown(_ sender: UILabel) {
        
        view.bringSubview(toFront: sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [sender.frame.height ,
                            sender.frame.height  + 766,
                ]
        animation.keyTimes = [0, 1.6]
        animation.duration = 1.2
        sender.layer.add(animation, forKey: "fall")
        let moneyKeptHeight = NSLayoutConstraint(item: moneyKeptLabel, attribute: .top, relatedBy: .equal,
                                                 toItem: self.view, attribute: .centerY, multiplier: 1.443, constant: 0)
        self.view.addConstraint(moneyKeptHeight)

    }

    func labelSlideUp(_ sender: UILabel) {
        
        view.bringSubview(toFront: sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [sender.frame.height + 650,
                           sender.frame.height + 498,
        ]
        animation.keyTimes = [0, 1.6]
        animation.duration = 1.2
        sender.layer.add(animation, forKey: "rise")
        let moneyOwedHeight = NSLayoutConstraint(item: moneyOwedLabel, attribute: .top, relatedBy: .equal,
                                                 toItem: self.view, attribute: .centerY, multiplier: 1.7, constant: 0)
        self.view.addConstraint(moneyOwedHeight)
        
        
        
    }

}

extension UIImage{
    
    func alpha(_ value:CGFloat)->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
        
    }
}
extension UIColor {
    var darkGreen: UIColor {
        let color = UIColor(red: 0, green: 192, blue: 13, alpha: 1.0)
        return color
    }
}

extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}




