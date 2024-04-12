//
//  Calculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

class AdvancedCalculator {
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
                guard arrOperation.count > 2 else { return arrOperation }
                arrOperation[index] = calculate(index)
                let beforeIndex = index - 1
                let afterIndex = index + 1
                if (0..<arrOperation.count).contains(afterIndex) {
                    arrOperation.remove(at: afterIndex)
                }
                if (0..<arrOperation.count).contains(beforeIndex) {
                    arrOperation.remove(at: beforeIndex)
                }
                indexOpt = arrOperation.firstIndex(of: operation)
            }
        }
        return arrOperation
    }
    func calculate(_ index: Int) -> CalculatorKeys {
        let beforeIndex = arrOperation.index(before: index)
        let afterIndext = arrOperation.index(after: index)
        if afterIndext < arrOperation.count && beforeIndex >= 0 {
            guard let num1 = arrOperation[beforeIndex].extractDoublevalue,
                  let num2 = arrOperation[afterIndext].extractDoublevalue else { return arrOperation[index] }
                switch arrOperation[index] {
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
        } else {
            return arrOperation[index]
        }
    }
}
