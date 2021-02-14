//
//  ViewController.swift
//  Calculator
//
//  Created by Mehrdad on 2020-11-09.
//  Copyright © 2020 Seneca College. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    lazy var calculator = CalBrain()
    var isFirstDigit = true
    lazy var operation = String()
    
    
    // MARK: Outlets
    @IBOutlet weak var display: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: Actions
    
    @IBAction func digitPressed(_ sender: UIButton) {
        if isFirstDigit {
            display.text = sender.currentTitle
            isFirstDigit = false
        } else {
            display.text = display.text! + sender.currentTitle!
        }
    }
    
    
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        
        if let stringValue = display.text {
            if let doubleValue = Double(stringValue) {
                calculator.pushItem(number: doubleValue)
            }
        }
        isFirstDigit = true
        
        operation = sender.currentTitle!
    }
    
    
    
    @IBAction func enterPressed(_ sender: UIButton) {
        if let stringValue = display.text {
            if let doubleValue = Double(stringValue) {
                calculator.pushItem(number: doubleValue)
            }
        }
        
        if let result = calculator.calculate(operation: operation) {
                        display.text = "\(result)"
                    }
        isFirstDigit = true
    }

    
    
    @IBAction func clearPressed(_ sender: Any) {
        display.text = "0"
        calculator.items.removeAll()
    }
    
    
    
    @IBAction func plusMinusPressed(_ sender: Any) {
        if let stringValue = display.text {
            if let doubleValue = Double(stringValue) {
                let result = doubleValue * -1
                display.text = "\(result)"
            }
        }
    }
    
    
    
}

