//
//  ViewController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 3/4/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private let buttonController = ButtonController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        label.textColor = .black
        let customStackVertical = CustomStackVertical()
        let customRow: RowKeyBoard = RowKeyBoard(customStackVertical: customStackVertical, delegateAction: self)
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
}

extension ViewController: DelegateAction {
    func addActionButton(button: UIButton) {
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    @objc func onClick(_ button: Key) {
        guard let character = CalculatorKeys(tag: (button.titleLabel?.text)!) else { return }
        switch character {
        case CalculatorKeys.clear:
            buttonController.pulsations.removeAll()
        case CalculatorKeys.equals:
            buttonController.sendOperations()
        default:
            buttonController.addCharacter(character: character)
        }
        label.text! = buttonController.showOperations()
    }
}
