//
//  CustomStackView.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

final class CustomStackView : UIStackView {
    
    init() {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 10
    
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
