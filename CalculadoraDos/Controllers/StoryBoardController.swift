//
//  StoryBoardController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

class StoryBoardController: UIViewController {

    @IBOutlet weak var label: UILabel!
    let calculation = Calculations()
    
   
    @IBAction func onClick(_ button: UIButton) {
        
        let tag = button.titleLabel?.text
        if tag == " = " {
            
            sendOperations()
        } else if tag == "AC" {
            
            label.text = ""
        } else {
            
            addDigitToLabel(tag!)
        }
    }
    
    private func sendOperations() {

        
        if let textoLabel = label.text {
            
            let arrOperation = textoLabel.components(separatedBy: " ")

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
