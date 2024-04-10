//
//  ButtonController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 9/4/24.
//

import Foundation
import UIKit

class ButtonController {
    var pulsations: [CalculatorKeys] = []
    func addCharacter(character: CalculatorKeys) {
        if case .number(let num2) = character,
           case .number(let num1) = pulsations.last {
            pulsations.removeLast()
            pulsations.append(.number(10 * num1 + num2))
        } else {
            pulsations.append(character)
        }
    }
    func sendOperations() {
       if pulsations.count >= 3 {
           let instance = Calculator(arrOperation: pulsations)
           pulsations = instance.calculate()
        }
    }
    func showOperations() -> String {
        var aux: String = ""
        for xee in pulsations {
            if case .number(let num) = xee {
                let numentero = Double(Int(num))
                let numdecimal = num
                if (numdecimal).isEqual(to: numentero) {
                    aux += "\(Int(xee.extractDoublevalue))"
                } else {
                    aux += "\(xee.extractDoublevalue)"
                }
            } else {
                aux += " \(xee.raw) "
            }
            print(aux)
        }
        return aux
    }
}
