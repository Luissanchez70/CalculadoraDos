//
//  OperationsNegotiation.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 15/4/24.
//

import Foundation
class OperationsNegotiation {
    init() {}
    func calulate(sing: CalculatorKeys, number1: CalculatorKeys, number2: CalculatorKeys) throws -> CalculatorKeys? {
        if let num1 = number1.extractDoublevalue,
           let num2 = number2.extractDoublevalue {
            switch sing {
            case CalculatorKeys.division:
                return try OperationsNegotiation().division(num1, num2)
            case CalculatorKeys.multiplication:
                return OperationsNegotiation().multiplication(num1, num2)
            case CalculatorKeys.subtraction:
                return OperationsNegotiation().subtraction(num1, num2)
            case CalculatorKeys.dot:
                return try OperationsNegotiation().dot(num1, num2)
            default:
                return OperationsNegotiation().addition(num1, num2)
            }
        }
        return nil
    }
    func division(_ num1: Double, _ num2: Double) throws -> CalculatorKeys? {
        let aux = try DivisionCase().execute(num1: num1, num2: num2)
        return .number(aux)
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
    func dot(_ num1: Double, _ num2: Double) throws -> CalculatorKeys {
        let auxPow = pow(10, Double(String("\(Int(num2))").count))
        let auxDivision = try DivisionCase().execute(num1: num2, num2: auxPow)
        let aux = AdditionCase().execute(num1: num1, num2: auxDivision)
        return .number(aux)
    }
}
