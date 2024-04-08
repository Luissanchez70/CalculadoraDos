//
//  StoryBoardController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

class StoryBoardController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func onClick(_ button: UIButton) {
        if let tag = button.titleLabel?.text,
           let character = CalculatorKeys(tag: "\(tag)") {
            if character.rawValue == CalculatorKeys.clear.rawValue {
                label.text = ""
            } else if character.rawValue == CalculatorKeys.equals.rawValue {
                sendOperations()
            } else {
                if Int(tag) != nil {
                    writeOnLabel(tag)
                } else {
                    writeOnLabel(" \(tag) ")
                }
            }
        }
    }

    private func sendOperations() {
        if let textoLabel = (label.text) {
            let arrOperation = textoLabel.components(separatedBy: " ")
            if arrOperation.count >= 3 {
                let instance = Calculator(arrOperation: arrOperation)
                let result = instance.calculate()
                label.text = "\(result)"
            }
        }
    }
    private func writeOnLabel(_ digito: String) {
        var textoLabel = label.text ?? ""
        if !textoLabel.isEmpty {
            if textoLabel.last == " " && digito.contains("") {
                let aux = textoLabel.prefix(textoLabel.count-3)
                textoLabel = aux + digito
            } else {
                textoLabel += digito
            }
        } else {
            textoLabel += digito
        }
        label.text = textoLabel
    }
}
