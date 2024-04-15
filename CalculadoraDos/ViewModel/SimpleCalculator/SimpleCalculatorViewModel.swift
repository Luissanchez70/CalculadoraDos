//
//  SimpleCalculatorViewModel.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 12/4/24.
//

import Foundation
import UIKit

class SimpleCalculatorViewModel {
    // MARK: Variables and Contructor
    private var number1: CalculatorKeys?
    private var number2: CalculatorKeys?
    private var sing: CalculatorKeys?
    private var simpleCalculator: SimpleDelegateOperation?
    private var errorMsg: String?
    // MARK: - Public Functions
    func click(text: String) {
        let key = CalculatorKeys(tag: text)
        switch key {
        case .number(let double):
            if number1 == nil || sing == nil {
                returnNumber(double, &number1)
            } else {
                returnNumber(double, &number2)
            }
        case .clear:
            resetVariables()
            errorMsg = nil
            number1 = nil
        case .equals:
            manageData()
        default:
            if sing != nil {
                manageData()
            }
            sing = key
        }
    }
    func showOperations() -> String {
        guard let error = errorMsg else {
            if number1 == nil || sing == nil {
                guard let aux = number1?.rawRepresentation else { return "" }
                return aux
            } else {
                guard let num1 = number1?.rawRepresentation else { return "" }
                guard let aux = number2?.rawRepresentation else { return "\(num1)" }
                return aux
            }
        }
        return error
    }
}
// MARK: - Private Functions
private extension SimpleCalculatorViewModel {
    func manageData() {
        guard let singAux = sing, let number1Aux = number1, let number2Aux = number2 else { return }
        simpleCalculator = SimpleDelegateOperation(sing: singAux, numer1: number1Aux, number2: number2Aux)
        resetVariables()
    }
    func resetVariables() {
        sing = nil
        number2 = nil
        do {
            number1 = try simpleCalculator?.calulate()
        } catch DivisionCase.DivisionCaseError.divisionByZero {
            let error = DivisionCase.DivisionCaseError.divisionByZero
            errorMsg = error.rawValue
        } catch {
            errorMsg = "Error: unknown"
        }
    }
    func returnNumber(_ newDouble: Double, _ number: inout CalculatorKeys?) {
        if number == nil {
            number = CalculatorKeys.number(newDouble)
        } else {
            guard let lastValue = number?.extractDoublevalue else { return }
            number = CalculatorKeys.number(lastValue * 10 + newDouble)
        }
    }
}
