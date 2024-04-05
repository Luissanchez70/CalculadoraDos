//
//  Digitos.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

enum Digitos: CaseIterable {
    case num0, num1, num2, div, num3, num4, num5, mul, num6, num7, num8, minus, num9, point, plus, del, equals
    func tag() -> String {
        var tagStr: String
        switch self {
        case .div:
            tagStr = " / "
        case .mul:
            tagStr = " * "
        case .minus:
            tagStr = " - "
        case .plus:
            tagStr = " + "
        case .equals:
            tagStr = " = "
        case .point:
            tagStr = "."
        case .del:
            tagStr = "AC"
        default:
            tagStr = "num"
        }
        return tagStr
    }
}
