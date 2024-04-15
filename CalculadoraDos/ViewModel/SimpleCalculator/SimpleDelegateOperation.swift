//
//  SimpleCalculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 12/4/24.
//

import Foundation
import UIKit

class SimpleDelegateOperation {
    // MARK: Variables and constructor
    private var sing: CalculatorKeys
    private var numer1: CalculatorKeys
    private var number2: CalculatorKeys
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
                return OperationsNegotiation().division(num1, num2)
            case CalculatorKeys.multiplication:
                return OperationsNegotiation().multiplication(num1, num2)
            case CalculatorKeys.subtraction:
                return OperationsNegotiation().subtraction(num1, num2)
            case CalculatorKeys.dot:
                return OperationsNegotiation().dot(num1, num2)
            default:
                return OperationsNegotiation().addition(num1, num2)
            }
        }
        return nil
    }
}
