//
//  SimpleCalculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 12/4/24.
//

import Foundation
import UIKit

class SimpleCalculator {
    // MARK: Variables and constructor
    var sing: CalculatorKeys
    var numer1: CalculatorKeys
    var number2: CalculatorKeys
    init(sing: CalculatorKeys, numer1: CalculatorKeys, number2: CalculatorKeys) {
        self.sing = sing
        self.numer1 = numer1
        self.number2 = number2
    }
    // MARK: - Public Functions
    func calulate() -> CalculatorKeys? {
        if let num1 = numer1.extractDoublevalue,
           let num2 = number2.extractDoublevalue {
            switch sing {
            case CalculatorKeys.division:
                return .number(num1 / num2)
            case CalculatorKeys.multiplication:
                return .number(num1 * num2)
            case CalculatorKeys.subtraction:
                return .number(num1 - num2)
            case CalculatorKeys.dot:
                return .number(num1 + num2 / pow(10, Double(String("\(Int(num2))").count)))
            default:
                return .number(num1 + num2)
            }
        }
        return nil
    }
}
