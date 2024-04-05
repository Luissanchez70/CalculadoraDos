//
//  ViewController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 3/4/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contenedor: UIStackView!
    @IBOutlet weak var label: UILabel!
    let calculation = Calculations()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComponents()
    }
    private func loadComponents() {
        label.textColor = .black
        contenedor.spacing = 10
        mekeButtons()
    }
    private func mekeButtons() {
        var count = 0
        var pos = 0
        var row = CustomStackView()
        for digito in Digitos.allCases {
            addRowToStack(&count, &row)
            let button: CustomButton = CustomButton()
            let nameButton: String
            if digito.tag() == "num" {
                nameButton = "\(pos)"
                pos += 1
            } else {
                nameButton = digito.tag()
            }
            button.setTitle(nameButton, for: .normal)
            button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
            row.addArrangedSubview(button)
            count += 1
        }
        contenedor.addArrangedSubview(row)
    }
    private func addRowToStack(_ count: inout Int, _ row: inout CustomStackView) {
        if count == 4 {
            contenedor.addArrangedSubview(row)
            row = CustomStackView()
            count = 0
        }
    }
    @objc func onClick(_ btn: CustomButton) {
        if let tag = btn.title(for: .normal) {
            if tag == Digitos.equals.tag() {
                sendOperations()
            } else if tag == Digitos.del.tag() {
                label.text = ""
            } else {
                addDigitToLabel(tag)
            }
        }
    }
    private func sendOperations() {
        if let textoLabel = (label.text) {
            let arrOperation = textoLabel.components(separatedBy: " ")
            if arrOperation.count >= 3 {
                let result = calculation.getOperations(arrOperation)
                label.text = "\(result)"
            }
        }
    }
    private func addDigitToLabel(_ digito: String) {
        var textoLabel = label.text ?? ""
        if !textoLabel.isEmpty {
            if textoLabel.last == " " && digito.contains(" ") {
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
