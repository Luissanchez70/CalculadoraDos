//
//  ViewController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 3/4/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        label.textColor = .black
        let customStackVertical = CustomStackVertical()
        let customRow: CustomRow = CustomRow(customStackVertical: customStackVertical, delegateAction: self)
        customRow.configure()
        view.addSubview(customStackVertical)
        NSLayoutConstraint.activate([
            customStackVertical.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            customStackVertical.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            customStackVertical.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            customStackVertical.widthAnchor.constraint(equalToConstant: 341),
            customStackVertical.heightAnchor.constraint(equalToConstant: 431)
        ])
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

extension ViewController: DelegateAction {
    func addActionButton(button: UIButton) {
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    @objc func onClick(_ btn: CustomButton) {
        if let tag = btn.titleLabel?.text,
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
}

extension ViewController {
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
}
