//
//  CustomStackView.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

final class CustomStackView: UIStackView {
    init() {
        super.init(frame: .zero)
        configure()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    private func configure() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 10
    }
}
