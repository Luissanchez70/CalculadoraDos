//
//  Calculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

class Calculator {
    var arrOperation: [String]
    let operators: [String] = [CalculatorKeys.div.rawValue,
                               CalculatorKeys.mul.rawValue,
                               CalculatorKeys.minus.rawValue,
                               CalculatorKeys.plus.rawValue]
    init(arrOperation: [String]) {
        self .arrOperation = arrOperation
    }
    func calculate() -> String {
        for opera in operators {
            for aux in stride(from: 1, to: arrOperation.count-1, by: 2) {
                if  let num1 = Double(arrOperation[aux-1]),
                    let num2 = Double(arrOperation[aux+1]),
                    opera == arrOperation[aux] {
                    let result = extractedFunc(num1, num2, opera)
                    arrOperation[aux] = " "
                    arrOperation[aux-1] = " "
                    arrOperation[aux+1] = "\(result)"
                }
            }
            arrOperation = arrOperation.filter { !$0.contains(" ") }
        }
       return arrOperation[0]
    }
    func extractedFunc(_ num1: Double, _ num2: Double, _ opera: String) -> Double {
        let number1 = CalculatorFunctions.number(num1)
        let number2 = CalculatorFunctions.number(num2)
        var result: Double {
            var operation: CalculatorFunctions
            switch opera {
            case "/":
                operation = CalculatorFunctions.division(number1, number2)
            case "*":
                operation = CalculatorFunctions.multiplication(number1, number2)
            case "-":
                operation = CalculatorFunctions.subtraction(number1, number2)
            default:
                operation = CalculatorFunctions.addition(number1, number2)
            }
            return operation.evaluate(operation)
        }
        return result
    }
}
