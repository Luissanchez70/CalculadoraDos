//
//  DivisionCase.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 15/4/24.
//

import Foundation

class DivisionCase {
    enum DivisionCaseError: Error {
        case divisionByZero
    }
    func execute(num1: Double, num2: Double) throws -> Double {
        guard num2 != 0 else { throw DivisionCaseError.divisionByZero }
        return num1 / num2
    }
}
extension DivisionCase.DivisionCaseError {
    var rawValue: String {
        switch self {
        case .divisionByZero:
            return "Error: Cannot divide by zero"
        }
    }
}
