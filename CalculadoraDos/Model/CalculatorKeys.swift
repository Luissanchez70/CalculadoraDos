//
//  Digitos.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

enum CalculatorKeys {
    case number(Int),
         division,
         multiplication,
         subtraction,
         dot,
         addition,
         clear,
         equals,
         percent,
        result(Double)
}

extension CalculatorKeys {
    var raw: String {
        var value: String
        switch self {
        case .number(let num):
            value = "\(num)"
        case .division:
            value = "/"
        case .multiplication:
            value = "*"
        case .subtraction:
            value = "-"
        case .dot:
            value = "."
        case .addition:
            value = "+"
        case .clear:
            value = "AC"
        case .equals:
            value = "="
        case .percent:
            value = "%"
        case .result(let res):
            value = "\(res)"
        }
        return value
    }
    init?(tag: String) {
        switch tag {
        case "0"..."9": self = .number(Int(tag)!)
        case "/":  self = .division
        case "*": self = .multiplication
        case "-": self = .subtraction
        case ".": self = .dot
        case "+": self = .addition
        case "AC": self = .clear
        case "=": self = .equals
        default: return nil
        }
    }
}

extension CalculatorKeys {
    func extractDoublevalue() -> Double {
        if let value =  Double(self.raw) {
            return value
        }
        return 0
    }
}
extension CalculatorKeys: Equatable { }
