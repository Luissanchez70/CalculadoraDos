//
//  CustomButton.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

final class CustomButton: UIButton {
    
    public var digitType: Digitos?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        custom()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func custom() {
        
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .lightGray
        self.widthAnchor.constraint(equalToConstant: 80).isActive = true
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.layer.cornerRadius = 40
    }
}
