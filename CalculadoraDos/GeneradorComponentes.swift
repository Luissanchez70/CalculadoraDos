//
//  GeneradorComponentes.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 3/4/24.
//

import Foundation
import UIKit


class GeneradorComponentes {
    
    private static let signos = " / + - X = AC"
    static func makeButton(_ tag: String) -> UIButton {
        
        let button = UIButton(type: .custom)
        button.setTitle(tag, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = colorFondo(tag)
        button.layer.cornerRadius = tag == " + " ? 30 : 40
        button.widthAnchor.constraint(equalToConstant: tag == " + " ? 120 : 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        return button
    }
    
    private static func colorFondo(_ tag: String) -> UIColor{
        
        var color: UIColor = .lightGray
        if(signos.contains(tag)) {
            color = .orange
        }
        
        return color
    }
    
    static func makeRow() -> UIStackView{
        
        let row: UIStackView = UIStackView()
        row.axis = .horizontal
        row.distribution = .fillEqually
        row.spacing = 10
        
        return row
    }
}
