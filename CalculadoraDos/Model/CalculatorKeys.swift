//
//  Digitos.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

enum CalculatorKeys {
    case number(Int),
         div,
         mul,
         minus,
         dot,
         plus,
         clear,
         equals,
         percent
}

extension CalculatorKeys {
    var rawValue: String {
        var value: String
        switch self {
        case .number(let int):
            value = "\(int)"
        case .div:
            value = "/"
        case .mul:
            value = "*"
        case .minus:
            value = "-"
        case .dot:
            value = "."
        case .plus:
            value = "+"
        case .clear:
            value = "AC"
        case .equals:
            value = "="
        case .percent:
            value = "%"
        }
        return value
    }
    init?(tag: String) {
        switch tag {
        case "0"..."9": self = .number(Int(tag)!)
        case "/":  self = .div
        case "*": self = .mul
        case "-": self = .minus
        case ".": self = .dot
        case "+": self = .plus
        case "AC": self = .clear
        case "=": self = .equals
        default: return nil
        }
    }
}

extension CalculatorKeys: Equatable { }
