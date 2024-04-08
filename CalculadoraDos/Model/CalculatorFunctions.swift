//
//  CalculatorOperations.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

indirect enum CalculatorFunctions {
    case number(Double),
         division(CalculatorFunctions, CalculatorFunctions),
         multiplication(CalculatorFunctions, CalculatorFunctions),
         addition(CalculatorFunctions, CalculatorFunctions),
         subtraction(CalculatorFunctions, CalculatorFunctions)
}

extension CalculatorFunctions {
    func evaluate(_ expression: CalculatorFunctions) -> Double {
        var result: Double
        switch expression {
        case let .number(value):
            result = value
        case let .addition(left, right):
            result = evaluate(left) + evaluate(right)
        case let .multiplication(left, right):
            result = evaluate(left) * evaluate(right)
        case let .subtraction(left, right):
            result = evaluate(left) + evaluate(right)
        case let .division(left, right):
            result = evaluate(left) / evaluate(right)
        }
        return result
    }
}
