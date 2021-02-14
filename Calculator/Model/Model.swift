//
//  Model.swift
//  Calculator
//
//  Created by Mehrdad on 2020-11-09.
//  Copyright © 2020 Seneca College. All rights reserved.
//

import Foundation


struct CalBrain {
    lazy var items: [Double] = [0]
    
    mutating func pushItem(number: Double) {
        items.append(number)
    }
    
    mutating func calculate(operation: String) -> Double? {
        let secondItem = popItem()
        let firstItem = popItem()
        
        var result: Double = 0
        
        switch operation {
        case "+":
            result = firstItem + secondItem
        case "-":
            result = firstItem - secondItem
        case "*":
            result = firstItem * secondItem
        case "/":
            result = firstItem / secondItem
        case "%":
            result = firstItem.truncatingRemainder(dividingBy: secondItem)
        default:
            print("Invalid operator")
        }
        return result
    }
    
    mutating func popItem() -> Double {
        let lastItem = items.removeLast()
        return lastItem
    }
}
