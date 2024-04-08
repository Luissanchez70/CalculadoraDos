//
//  CustomKeyBoard.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 8/4/24.
//

import Foundation
import UIKit

class CustomStackVertical: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        self.axis = .vertical
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
