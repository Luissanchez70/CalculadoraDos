//
//  OperationsNegotiation.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 15/4/24.
//

import Foundation

class OperationsNegotiation {
    init() {}
    func division(_ num1: Double, _ num2: Double) throws -> CalculatorKeys? {
        do {
            let aux = try DivisionCase().execute(num1: num1, num2: num2)
            return .number(aux)
        } catch DivisionCase.DivisionCaseError.divisionByZero {
            throw DivisionCase.DivisionCaseError.divisionByZero
        }
    }
    func multiplication(_ num1: Double, _ num2: Double) -> CalculatorKeys {
        let aux = MultiplicationCase().execute(num1: num1, num2: num2)
        return .number(aux)
    }
    func addition(_ num1: Double, _ num2: Double) -> CalculatorKeys {
        let aux = AdditionCase().execute(num1: num1, num2: num2)
        return .number(aux)
    }
    func subtraction(_ num1: Double, _ num2: Double) -> CalculatorKeys {
        let aux = SubtractionCase().execute(num1: num1, num2: num2)
        return .number(aux)
    }
    func dot(_ num1: Double, _ num2: Double) -> CalculatorKeys {
        do {
            let auxPow = pow(10, Double(String("\(Int(num2))").count))
            let auxDivision = try DivisionCase().execute(num1: num2, num2: auxPow)
            let aux = AdditionCase().execute(num1: num1, num2: auxDivision)
            return .number(aux)
        } catch {
            return .number(0)
        }
    }
}
