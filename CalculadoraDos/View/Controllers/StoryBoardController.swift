//
//  StoryBoardController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

class StoryBoardController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private let simpleCalculator = SimpleCalculatorViewModel()
    @IBAction func onClick(_ button: UIButton) {
        guard let text = button.titleLabel?.text else { return }
        simpleCalculator.click(text: text)
        label.text = simpleCalculator.showOperations()
    }
}
