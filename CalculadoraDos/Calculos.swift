//
//  Calculos.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 3/4/24.
//

import Foundation

class Calculos{
    
    private static let operaciones: [String] = ["/","X","-","+"]
    
    static func getOperation(_ operacion: String) -> Double{
        
        var array_digitos = operacion.split(separator: " ")
       
        
        for signo in operaciones {
           
            for i in stride(from: 1, to: array_digitos.count, by: 2) {
                
                if (array_digitos[i] == signo) {
                    
                    let num1 = Double(array_digitos[i-1]) ?? 0.0
                    let num2 = Double(array_digitos[i+1]) ?? 0.0
                    let restultado = derivar(signo, num1, num2)
                    array_digitos[i] = " "
                    array_digitos[i-1] = " "
                    array_digitos[i+1] = "\(restultado)"
                }
            }
            array_digitos = array_digitos.filter{ !$0.contains(" ")}
          
        }
        
        return Double(array_digitos[0]) ?? 0.0
    }
    
    private static func derivar(_ signo: String,_ num1: Double, _ num2: Double) -> Double{
        
        var resultado: Double = 0.0;
        
        switch signo {
            case "/":
                resultado = num1 / num2
            case "X":
                resultado = num1 * num2
            case "-":
            resultado = num1 - num2
            case "+":
                resultado = num1 + num2
            default:
                print("No contemplado")
        }
        return resultado
    }

}
