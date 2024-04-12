//
//  ButtonController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 9/4/24.
//

import Foundation
import UIKit

class CalculatorViewModel {
    // MARK: Variables
    var pulsations: [CalculatorKeys] = []
    // MARK: - Public Functions
    func click(text: String) {
        guard let character = CalculatorKeys(tag: text) else { return }
        // TO DO: falta añadir logica ...
        switch character {
        case CalculatorKeys.clear:
            pulsations.removeAll()
        case CalculatorKeys.equals:
            sendOperations()
        default:
            addCharacter(character: character)
        }
    }
    func showOperations() -> String {
        // FIX ME: esto hay que arreglarlo
        pulsations.map { $0.rawRepresentation } .joined()
    }
}
// MARK: - Private Functions
private extension CalculatorViewModel {
    func addCharacter(character: CalculatorKeys) {
        if case .number(let newNumber) = character,
           case .number(let lastNumber) = pulsations.last {
            pulsations.removeLast()
            pulsations.append(.number(10 * lastNumber + newNumber))
        } else {
            pulsations.append(character)
        }
    }
    func sendOperations() {
       if pulsations.count >= 3 {
           let instance = AdvancedCalculator(arrOperation: pulsations)
           pulsations = instance.calculate()
        }
    }
}
