//
//  MoneyController.swift
//  CalculatorYearlyPay
//
//  Created by ALIA M NEELY on 5/26/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class MoneyController {
    
    static var shared = MoneyController()
    
  
   static func calculateYearPayByHourly(wage: Double) -> Double {
        
        let salary = Double(wage * 2080)
        
        if salary < 9275 {
            return salary * 0.90
        }
        if salary > 9275 && salary < 37650 {
            let tax = (salary - 9275) * 0.15 + 927.50
            return salary - tax
        }
        if salary > 37650 && salary < 91150 {
            let tax =  (salary - 37650) * 0.25 + 5183.75
            return salary - tax
        }
        if salary > 91150 && salary < 191150 {
            let tax = (salary - 91150) * 0.28 + 18558.75
            return salary - tax
        }
        if salary > 191150 && salary < 413350 {
            let tax = (salary - 191150) * 0.33 + 46278.75
            return salary - tax
        }
        if salary > 413350 && salary < 466950 {
            let tax = (salary - 413350) * 0.35 + 119934.75
            return salary - tax
        }
        if salary > 466950 {
            let tax = (salary - 466950) * 0.396 + 120529.75
            return salary - tax
        }
        return 0.00
    }
    
    
    
   static func calculateYearlyPayWith(salary: Double) -> Double {
        
        if salary < 9275 {
            return salary * 0.90
        }
        if salary > 9275 && salary < 37650 {
            let tax = (salary - 9275) * 0.15 + 927.50
            return salary - tax
        }
        if salary > 37650 && salary < 91150 {
            let tax =  (salary - 37650) * 0.25 + 5183.75
            return salary - tax
        }
        if salary > 91150 && salary < 191150 {
            let tax = (salary - 91150) * 0.28 + 18558.75
            return salary - tax
        }
        if salary > 191150 && salary < 413350 {
            let tax = (salary - 191150) * 0.33 + 46278.75
            return salary - tax
        }
        if salary > 413350 && salary < 466950 {
            let tax = (salary - 413350) * 0.35 + 119934.75
            return salary - tax
        }
        if salary > 466950 {
            let tax = (salary - 466950) * 0.396 + 120529.75
            return salary - tax
        }
        return 0.00
    }
    
    static func calculateTaxAmountWith(salary: Double) -> Double {
        
        if salary < 9275 {
            return salary * 0.10
        }
        if salary > 9275 && salary < 37650 {
            let tax = (salary - 9275) * 0.15 + 927.50
            return tax
        }
        if salary > 37650 && salary < 91150 {
            let tax =  (salary - 37650) * 0.25 + 5183.75
            return tax
        }
        if salary > 91150 && salary < 191150 {
            let tax = (salary - 91150) * 0.28 + 18558.75
            return tax
        }
        if salary > 191150 && salary < 413350 {
            let tax = (salary - 191150) * 0.33 + 46278.75
            return tax
        }
        if salary > 413350 && salary < 466950 {
            let tax = (salary - 413350) * 0.35 + 119934.75
            return tax
        }
        if salary > 466950 {
            let tax = (salary - 466950) * 0.396 + 120529.75
            return tax
        }
        return 0.00
    }
    
    
    static func calculateTaxByHourly(wage: Double) -> Double {
        
        let salary = Double(wage * 2080)
        
        if salary < 9275 {
            return salary * 0.10
        }
        if salary > 9275 && salary < 37650 {
            let tax = (salary - 9275) * 0.15 + 927.50
            return tax
        }
        if salary > 37650 && salary < 91150 {
            let tax =  (salary - 37650) * 0.25 + 5183.75
            return tax
        }
        if salary > 91150 && salary < 191150 {
            let tax = (salary - 91150) * 0.28 + 18558.75
            return tax
        }
        if salary > 191150 && salary < 413350 {
            let tax = (salary - 191150) * 0.33 + 46278.75
            return tax
        }
        if salary > 413350 && salary < 466950 {
            let tax = (salary - 413350) * 0.35 + 119934.75
            return tax
        }
        if salary > 466950 {
            let tax = (salary - 466950) * 0.396 + 120529.75
            return tax
        }
        return 0.00
    }
    
    
}
