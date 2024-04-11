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
        guard let text = button.titleLabel?.text else { return }
        buttonController.click(text: text)
        label.text = buttonController.showOperations()
        label.text = buttonController.showOperations()
    }
}
