//
//  CustomStackView.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

final class ContentKeyBoard: UIStackView {
    init() {
        super.init(frame: .zero)
        setupView()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 10
    }
}
