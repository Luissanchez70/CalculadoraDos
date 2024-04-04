//
//  Digitos.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

enum Digitos: CaseIterable {
    case num0 ,num1 ,num2 ,division ,num3  ,num4 ,num5 ,multiplication ,num6  ,num7 ,num8 ,subtraction ,num9 ,point ,addition ,delete ,equals
    
    func tag() -> String {
        
        var tagStr: String
        
        switch self {
        case .num0:
            tagStr = "0"
        case .num1:
            tagStr = "1"
        case .num2:
            tagStr = "2"
        case .num3:
            tagStr = "3"
        case .num4:
            tagStr = "4"
        case .num5:
            tagStr = "5"
        case .num6:
            tagStr = "6"
        case .num7:
            tagStr = "7"
        case .num8:
            tagStr = "8"
        case .num9:
            tagStr = "9"
        case .division:
            tagStr = " / "
        case .multiplication:
            tagStr = " * "
        case .subtraction:
            tagStr = " - "
        case .addition:
            tagStr = " + "
        case .equals:
            tagStr = " = "
        case .point:
            tagStr = "."
        case .delete:
            tagStr = "AC"
        }
        
        return tagStr
    }
}
