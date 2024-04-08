//
//  AddCustomButton.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation
import UIKit

class CustomRow {
    let operations = [CalculatorKeys.div,
                      CalculatorKeys.mul,
                      CalculatorKeys.plus,
                      CalculatorKeys.dot,
                      CalculatorKeys.minus,
                      CalculatorKeys.clear,
                      CalculatorKeys.equals
    ]
    let customStackVertical: CustomStackVertical
    let delegateAction: DelegateAction
    init(customStackVertical: CustomStackVertical, delegateAction: DelegateAction) {
        self.customStackVertical = customStackVertical
        self.delegateAction = delegateAction
    }
     func configure() {
        var itemPerRow = 0
        var positionOperation = 0
        var positionNumber = 0
        var rowStackView = CustomStackHorizontal()
        for _ in 0...16 {
            addRowToStack(&itemPerRow, &rowStackView)
            let btn = CustomButton()
            var title: String?
            if positionNumber <= 9 && itemPerRow < 3 {
                title = "\(positionNumber)"
                positionNumber += 1
            } else {
                if positionOperation < operations.count {
                    title = "\(String(operations[positionOperation].rawValue))"
                    positionOperation += 1
                }
            }
            btn.setTitle(title, for: .normal)
            delegateAction.addActionButton(button: btn)
            rowStackView.addArrangedSubview(btn)
            print(title!)
            itemPerRow += 1
        }
         customStackVertical.addArrangedSubview(rowStackView)
    }
    private func addRowToStack(_ itemPerRow: inout Int, _ rowStackView: inout CustomStackHorizontal) {
        if itemPerRow == 4 {
            customStackVertical.addArrangedSubview(rowStackView)
            rowStackView = CustomStackHorizontal()
            itemPerRow = 0
        }
    }
}
