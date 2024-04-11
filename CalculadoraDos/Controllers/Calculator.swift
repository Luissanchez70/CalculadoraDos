//
//  Calculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

class Calculator {
    var arrOperation: [CalculatorKeys]
    let operators: [CalculatorKeys] = [CalculatorKeys.division,
                                       CalculatorKeys.multiplication,
                                       CalculatorKeys.subtraction,
                                       CalculatorKeys.addition]
    init(arrOperation: [CalculatorKeys]) {
        self .arrOperation = arrOperation
    }
    func calculate() -> [CalculatorKeys] {
        for operation in operators {
            var pos = 0
            while pos < arrOperation.count-1 {
                if operation == arrOperation[pos] {
                    let resultPosition: CalculatorKeys = calculate(position: pos)
                    arrOperation[pos] = resultPosition
                    arrOperation.remove(at: pos+1)
                    arrOperation.remove(at: pos-1)
                    pos = 0
                }
                pos += 1
            }
        }

        return arrOperation
    }
    func calculate(position: Int) -> CalculatorKeys {
        var aux: CalculatorFunctions = .number(0)
        if let num1 = arrOperation[position-1].extractDoublevalue,
           let num2 = arrOperation[position+1].extractDoublevalue {
            switch arrOperation[position] {
            case CalculatorKeys.division:
                aux = CalculatorFunctions.division(.number(num1), .number(num2))
            case CalculatorKeys.multiplication:
                aux = CalculatorFunctions.multiplication(.number(num1), .number(num2))
            case CalculatorKeys.subtraction:
                aux = CalculatorFunctions.subtraction(.number(num1), .number(num2))
            default:
                aux = CalculatorFunctions.addition(.number(num1), .number(num2))
            }
        }
        return CalculatorKeys.number(aux.evaluate(aux))
    }
}
