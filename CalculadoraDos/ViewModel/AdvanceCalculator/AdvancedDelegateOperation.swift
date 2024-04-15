//
//  Calculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

class AdvancedDelegateOperation {
    // MARK: - Variables and constructor
    private var arrOperation: [CalculatorKeys]
    private let operators: [CalculatorKeys] = [CalculatorKeys.dot,
                                       CalculatorKeys.division,
                                       CalculatorKeys.multiplication,
                                       CalculatorKeys.subtraction,
                                       CalculatorKeys.addition]
    init(arrOperation: [CalculatorKeys]) {
        self .arrOperation = arrOperation
    }
    // MARK: - Public Functions
    func calculate() throws -> [CalculatorKeys] {
        for operation in operators {
            var indexOpt = arrOperation.firstIndex(of: operation)
            while let index = indexOpt {
                guard arrOperation.count > 2 else { return arrOperation }
                guard let aux = try calculate(index) else { throw DivisionCase.DivisionCaseError.divisionByZero }
                arrOperation[index] = aux
                let beforeIndex = index - 1
                let afterIndex = index + 1
                if (0..<arrOperation.count).contains(afterIndex) {
                    arrOperation.remove(at: afterIndex)
                }
                if (0..<arrOperation.count).contains(beforeIndex) {
                    arrOperation.remove(at: beforeIndex)
                }
                indexOpt = arrOperation.firstIndex(of: operation)
            }
        }
        return arrOperation
    }
}
// MARK: - Private Functions
private extension AdvancedDelegateOperation {
    func calculate(_ index: Int) throws -> CalculatorKeys? {
        let beforeIndex = arrOperation.index(before: index)
        let afterIndext = arrOperation.index(after: index)
        if afterIndext < arrOperation.count && beforeIndex >= 0 {
            guard let num1 = arrOperation[beforeIndex].extractDoublevalue,
                  let num2 = arrOperation[afterIndext].extractDoublevalue else { return arrOperation[index] }
            switch arrOperation[index] {
            case .division:
                do {
                    return try OperationsNegotiation().division(num1, num2)
                } catch DivisionCase.DivisionCaseError.divisionByZero {
                    throw DivisionCase.DivisionCaseError.divisionByZero
                }
            case .multiplication:
                return OperationsNegotiation().multiplication(num1, num2)
            case .subtraction:
                return OperationsNegotiation().subtraction(num1, num2)
            case .dot:
                return OperationsNegotiation().dot(num1, num2)
            default:
                return OperationsNegotiation().addition(num1, num2)
            }
        } else {
            return arrOperation[index]
        }
    }
}
