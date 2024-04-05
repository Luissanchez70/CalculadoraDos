//
//  Calculations.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

final class Calculations {
    let orderOfOperations = [Digitos.div, Digitos.mul, Digitos.minus, Digitos.plus]
    func getOperations(_ arrOperation: [String]) -> Double {
        var arrOperation = arrOperation
        for operation in orderOfOperations {
            for pos in stride(from: 1, to: arrOperation.count, by: 2) {
                let operatorStr: String = " \(arrOperation[pos]) "
                if  let num1: Double = Double(arrOperation[pos-1]),
                    let num2: Double = Double(arrOperation[pos+1]),
                    operatorStr.contains(operation.tag()) {
                    let restultado = calculate(operatorStr, num1, num2)
                    arrOperation[pos] = " "
                    arrOperation[pos-1] = " "
                    arrOperation[pos+1] = "\(restultado)"
                }
            }
            arrOperation = arrOperation.filter { !$0.contains(" ") }
        }
        return Double(arrOperation[0]) ?? 0
    }
    private func calculate(_ sing: String, _ num1: Double, _ num2: Double) -> Double {
        var result: Double
        switch sing {
        case Digitos.div.tag():
            result = num1 / num2
        case Digitos.mul.tag():
            result = num1 * num2
        case Digitos.minus.tag():
            result = num1 - num2
        case Digitos.plus.tag():
            result = num1 + num2
        default:
            result = 0.0
        }
        return result
    }
}
