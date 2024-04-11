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
    func click(text: String) {
        guard let character = CalculatorKeys(tag: text) else { return }
        switch character {
        case CalculatorKeys.clear:
            pulsations.removeAll()
        case CalculatorKeys.equals:
            sendOperations()
        default:
            addCharacter(character: character)
        }
    }
    private func addCharacter(character: CalculatorKeys) {
        if case .number(let newNumber) = character,
           case .number(let lastNumber) = pulsations.last {
            pulsations.removeLast()
            pulsations.append(.number(10 * lastNumber + newNumber))
        } else {
            pulsations.append(character)
        }
    }
    private func sendOperations() {
       if pulsations.count >= 3 {
           let instance = Calculator(arrOperation: pulsations)
           pulsations = instance.calculate()
        }
    }
    func showOperations() -> String {
        pulsations.map { $0.rawRepresentation } .joined()
    }
}
