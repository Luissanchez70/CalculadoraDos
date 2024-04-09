//
//  StoryBoardController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

class StoryBoardController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private let buttonController = ButtonController()

    @IBAction func onClick(_ button: UIButton) {
        guard let character = CalculatorKeys(tag: (button.titleLabel?.text)!) else { return }
        switch character {
        case CalculatorKeys.clear:
            buttonController.pulsations.removeAll()
        case CalculatorKeys.equals:
            buttonController.sendOperations()
        default:
            buttonController.addCharacter(character: character)
        }
        showOperations()
    }
    func showOperations() {
        label.text  = buttonController.pulsations.map { $0.raw }.joined(separator: " ")
    }
}
