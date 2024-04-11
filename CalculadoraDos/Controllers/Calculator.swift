//
//  Calculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

class Calculator {
    var arrOperation: [CalculatorKeys]
    let operators: [CalculatorKeys] = [CalculatorKeys.dot,
                                       CalculatorKeys.division,
                                       CalculatorKeys.multiplication,
                                       CalculatorKeys.subtraction,
                                       CalculatorKeys.addition]
    init(arrOperation: [CalculatorKeys]) {
        self .arrOperation = arrOperation
    }
    func calculate() -> [CalculatorKeys] {
        for operation in operators {
            var indexOpt = arrOperation.firstIndex(of: operation)
            while let index = indexOpt {
                arrOperation[index] = calculate(index)
                arrOperation.remove(at: index+1)
                arrOperation.remove(at: index-1)
                indexOpt = arrOperation.firstIndex(of: operation)
            }
        }
        return arrOperation
    }
    func calculate(_ index: Int) -> CalculatorKeys {
        guard let num1 = arrOperation[index-1].extractDoublevalue,
              let num2 = arrOperation[index+1].extractDoublevalue else { return arrOperation[index] }
            switch arrOperation[index] {
            case CalculatorKeys.division:
                return .number(num1 / num2)
            case CalculatorKeys.multiplication:
                return .number(num1 * num2)
            case CalculatorKeys.subtraction:
                return .number(num1 - num2)
            case CalculatorKeys.dot:
                return .number(num1 + num2 / pow(10, Double(String(num2).count)))
            default:
                return .number(num1 + num2)
            }
    }
}
