//
//  Calculator.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation

class AdvancedDelegateOperation: OperationsNegotiation {
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
                guard let aux = try sendKeys(index) else { throw DivisionCase.DivisionCaseError.divisionByZero }
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
    func sendKeys(_ index: Int) throws -> CalculatorKeys? {
        if (index+1) < arrOperation.count && (index-1) >= 0 {
            let num1 = arrOperation[index-1]
            let num2 = arrOperation[index+1]
            let sing = arrOperation[index]
            return try calulate(sing: sing, number1: num1, number2: num2)
        }
        return nil
    }
}
