//
//  Money.swift
//  CalculatorYearlyPay
//
//  Created by ALIA M NEELY on 5/26/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation

class Wage {
    
    var dollarsAnHour = Double()
    
    
    init(dollarsAnHour: Double){
        self.dollarsAnHour = dollarsAnHour
    }
    
    init(withIntValue: Int){
        self.dollarsAnHour = Double(withIntValue)
    }

    
}
