//
//  AddCustomButton.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation
import UIKit

class RowKeyBoard {
    // MARK: Variables and constructor
    private let operations = [CalculatorKeys.division,
                      CalculatorKeys.multiplication,
                      CalculatorKeys.addition,
                      CalculatorKeys.dot,
                      CalculatorKeys.subtraction,
                      CalculatorKeys.clear,
                      CalculatorKeys.equals
    ]
    private let customStackVertical: CustomStackVertical
    private let delegateAction: DelegateAction
    init(customStackVertical: CustomStackVertical, delegateAction: DelegateAction) {
        self.customStackVertical = customStackVertical
        self.delegateAction = delegateAction
    }
    // MARK: - Public Functions
     func configure() {
        var itemPerRow = 0
        var positionOperation = 0
        var positionNumber = 0
        var rowStackView = ContentKeyBoard()
        for _ in 0...16 {
            addRowToStack(&itemPerRow, &rowStackView)
            let btn = Key()
            var title: String?
            if positionNumber <= 9 && itemPerRow < 3 {
                title = "\(positionNumber)"
                positionNumber += 1
            } else {
                if positionOperation < operations.count {
                    title = "\(String(operations[positionOperation].raw))"
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
}
// MARK: - Private Functions
private extension RowKeyBoard {
    func addRowToStack(_ itemPerRow: inout Int, _ rowStackView: inout ContentKeyBoard) {
        if itemPerRow == 4 {
            customStackVertical.addArrangedSubview(rowStackView)
            rowStackView = ContentKeyBoard()
            itemPerRow = 0
        }
    }
}
