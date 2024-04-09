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
        if pulsations.count > 0,
           case .number(let int) = character,
           case .number(let int) = pulsations[pulsations.count-1] {
            guard let rawInt = Int(("\(pulsations[pulsations.count-1].raw)\(character.raw)")) else { return }
            let newCharacter = CalculatorKeys.number(rawInt)
            pulsations[pulsations.count-1] = newCharacter
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
}
