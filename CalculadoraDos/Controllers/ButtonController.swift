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
    var activatedDot: Bool = false
    func addCharacter(character: CalculatorKeys) {
        if case .number(let num2) = character,
           case .number(let num1) = pulsations.last {
            let newKey: CalculatorKeys
            pulsations.removeLast()
            if activatedDot {
                guard let numDecimal = Double("\(Int(num1)).\(Int(num2))") else { return}
                newKey = .number(numDecimal)
                activatedDot = false
            } else {
                newKey = .number(10 * num1 + num2)
            }
            pulsations.append(newKey)
        } else if case .dot = character {
            activatedDot = true
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
                aux += numdecimal == numentero ? "\(Int(numentero))" : "\(numdecimal)"
            } else {
                aux += " \(xee.raw) "
            }
            print(aux)
        }
        return aux
    }
}
