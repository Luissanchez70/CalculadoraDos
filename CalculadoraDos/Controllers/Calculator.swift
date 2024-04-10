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
        let number1 = CalculatorFunctions.number(arrOperation[position-1].extractDoublevalue)
        let number2 = CalculatorFunctions.number(arrOperation[position+1].extractDoublevalue)
        print("num1 \(number1)")
        print("num1 \(number2)")
        let aux: CalculatorFunctions
        switch arrOperation[position] {
        case CalculatorKeys.division:
            aux = CalculatorFunctions.division(number1, number2)
        case CalculatorKeys.multiplication:
            aux = CalculatorFunctions.multiplication(number1, number2)
        case CalculatorKeys.subtraction:
            aux = CalculatorFunctions.subtraction(number1, number2)
        default:
            aux = CalculatorFunctions.addition(number1, number2)
        }
        return CalculatorKeys.number( aux.evaluate(aux) )
    }
}
