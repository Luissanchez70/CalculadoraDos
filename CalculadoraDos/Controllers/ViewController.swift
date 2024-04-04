//
//  ViewController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 3/4/24.
//

import UIKit

class ViewController: UIViewController {
    
 

    @IBOutlet weak var contenedor: UIStackView!
    @IBOutlet weak var label: UILabel!
    let calculation = Calculations()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadComponents()
    }
    
    private func loadComponents() {
        
        label.textColor = .black
        contenedor.spacing = 10
        mekeButtons()
    }
    
    private func mekeButtons() {
        
        var count = 0
        var row = CustomStackView()
        
        for digito in Digitos.allCases {
            
            if count == 4 {
                contenedor.addArrangedSubview(row)
                row = CustomStackView()
                count = 0
            }

            let button: CustomButton = CustomButton()
            
            button.digitType = digito
            button.setTitle(digito.tag() , for: .normal)
            button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
            row.addArrangedSubview(button)
            count += 1
        }
        
        contenedor.addArrangedSubview(row)
    }
    
    
    @objc func onClick(_ btn: CustomButton) {
        
        if btn.digitType == .equals {
            sendOperations()
        } else if btn.digitType == .delete {
            label.text = ""
        } else {
            addDigitToLabel(btn.title(for: .normal)!)
        }
    }
    
    private func sendOperations() {
        
        let textoLabel = (label.text)
        if textoLabel != nil {
            
            let arrOperation = textoLabel!.components(separatedBy: " ")
            if arrOperation.count >= 3 {
               
                let result = calculation.getOperations(arrOperation)
                label.text = "\(result)"
            }
            
        }
    }
    
    private func addDigitToLabel(_ digito: String) {
        
        var textoLabel = label.text ?? ""
        
        if (textoLabel.count > 0){
            
            if(textoLabel.last == " " && digito.contains(" ")){
                
                let aux = textoLabel.prefix(textoLabel.count-3)
                textoLabel = aux + digito
            }else{
                
                textoLabel += digito
            }
        }else{
            
            textoLabel += digito
        }
        
        label.text = textoLabel
    }

}

