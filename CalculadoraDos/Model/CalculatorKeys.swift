//
//  Digitos.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

enum CalculatorKeys {
    case number(Double),
         division,
         multiplication,
         subtraction,
         dot,
         addition,
         clear,
         equals
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
        }
        return value
    }
    init?(tag: String) {
        switch tag {
        case "0"..."9": self = .number(Double(tag)!)
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
    var extractDoublevalue: Double? {
        switch self {
        case .number(let value):
            return value
        default: return nil
        }
    }
}

extension CalculatorKeys: Equatable { }
