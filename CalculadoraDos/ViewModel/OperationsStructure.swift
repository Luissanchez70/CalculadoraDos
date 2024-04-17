//
//  OperationsStructure.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 17/4/24.
//

import Foundation

protocol OperationsStructure {
    func division(_ num1: Double, _ num2: Double) throws -> CalculatorKeys?
    func multiplication(_ num1: Double, _ num2: Double) -> CalculatorKeys
    func addition(_ num1: Double, _ num2: Double) -> CalculatorKeys
    func subtraction(_ num1: Double, _ num2: Double) -> CalculatorKeys
    func dot(_ num1: Double, _ num2: Double) throws -> CalculatorKeys
}
