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
    private var pulsations: [CalculatorKeys] = []
    private var errorMsg: String?
    // MARK: - Public Functions
    func click(text: String) {
        guard let character = CalculatorKeys(tag: text) else { return }
        switch character {
        case CalculatorKeys.clear:
            pulsations.removeAll()
            errorMsg = nil
        case CalculatorKeys.equals:
            sendOperations()
        default:
            addCharacter(character: character)
        }
    }
    func showOperations() -> String {
        guard let error = errorMsg else {
            return pulsations.map { $0.rawRepresentation } .joined()
        }
        return error
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
           let instance = AdvancedDelegateOperation(arrOperation: pulsations)
           do {
               pulsations = try instance.calculate()
           } catch DivisionCase.DivisionCaseError.divisionByZero {
               let error = DivisionCase.DivisionCaseError.divisionByZero
               errorMsg = error.rawValue
           } catch {
               errorMsg = "Error: unknown"
           }
        }
    }
}
