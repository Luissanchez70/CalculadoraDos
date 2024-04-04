//
//  StoryBoardController.swift
//  CalculadoraDos
//
//  Created by Luis Fernando Sanchez Muñoz on 4/4/24.
//

import UIKit

class StoryBoardController: UIViewController {

    @IBOutlet weak var num0: UIButton!
    @IBOutlet weak var num1: UIButton!
    @IBOutlet weak var num2: UIButton!
    @IBOutlet weak var num3: UIButton!
    @IBOutlet weak var num4: UIButton!
    @IBOutlet weak var num5: UIButton!
    @IBOutlet weak var num6: UIButton!
    @IBOutlet weak var num7: UIButton!
    @IBOutlet weak var num8: UIButton!
    @IBOutlet weak var num9: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var substraction: UIButton!
    @IBOutlet weak var addition: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var equals: UIButton!
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var label: UILabel!
    let calculation = Calculations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addOnClick()
       
    }
    
    private func addOnClick() {
    
        multiplication.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        substraction.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        division.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        addition.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        equals.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        delete.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        point.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num0.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num1.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num2.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num3.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num4.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num5.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num6.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num7.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num8.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        num9.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        num0.setTitle("0", for: .normal)
    }

    @objc func onClick(_ button: UIButton) {
        
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

        let textoLabel = label.text
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
