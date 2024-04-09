//
//  CustomButton.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

final class Key: UIButton {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .lightGray
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.layer.cornerRadius = 40
    }
}
