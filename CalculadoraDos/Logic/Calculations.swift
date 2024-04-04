//
//  Calculations.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import Foundation

final class Calculations {
    
    let orderOfOperations = [Digitos.division, Digitos.multiplication, Digitos.subtraction, Digitos.addition]
    
    
    func getOperations(_ arrOperation: [String]) -> Double {
        
        var arrOperation = arrOperation
        for operation in orderOfOperations {
            
            for i in stride(from: 1, to: arrOperation.count, by: 2) {
                
                let operatorStr: String = " \(arrOperation[i]) "
                
                if operatorStr.contains(operation.tag()) {
                                        
                    let num1: Double = Double(arrOperation[i-1])!
                    let num2: Double = Double(arrOperation[i+1])!
                    let restultado = calculate(operatorStr, num1, num2)
             
                    arrOperation[i] = " "
                    arrOperation[i-1] = " "
                    arrOperation[i+1] = "\(restultado)"
                }
            }
            
            arrOperation = arrOperation.filter{ !$0.contains(" ")}
        }
        
        return Double(arrOperation[0]) ?? 0
    }
    
    private func calculate(_ sing: String, _ num1: Double, _ num2: Double) -> Double {
        
        var result: Double
        
        switch sing {
        case Digitos.division.tag():
            result = num1 / num2
        case Digitos.multiplication.tag():
            result = num1 * num2
        case Digitos.subtraction.tag():
            result = num1 - num2
        case Digitos.addition.tag():
            result = num1 + num2
        default:
            result = 0.0
        }
     
        return result
    }
}
