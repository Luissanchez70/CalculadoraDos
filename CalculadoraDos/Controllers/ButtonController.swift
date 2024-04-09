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
        guard !pulsations.isEmpty,
              case .number(let num2) = character,
              case .number(let num1) = pulsations[pulsations.count-1]  else {
            pulsations.append(character)
            return
        }
        guard let rawInt = Int(("\(num1)\(num2)")) else { return }
        pulsations[pulsations.count-1] = CalculatorKeys.number(rawInt)
    }
    func sendOperations() {
       if pulsations.count >= 3 {
           let instance = Calculator(arrOperation: pulsations)
           pulsations = instance.calculate()
        }
    }
}
