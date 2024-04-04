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
    private let botonesTags: [String] = ["1","2","3","AC","4","5","6"," - ","7","8","9"," X ","0","."," / "," + ","="]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadPantalla()
    }
    
    private func loadPantalla(){
        
        view.backgroundColor = .black
        label.textColor = .white
        contenedor.spacing = 10
        cargarButtons()
    }
    
    private func cargarButtons() {
        
        var count = 1
        var row: UIStackView = GeneradorComponentes.makeRow()
        
        for tag in botonesTags {
            
            if (count == 5) {
                contenedor.addArrangedSubview(row)
                row = GeneradorComponentes.makeRow()
                count = 1
            }
            
            let button: UIButton = GeneradorComponentes.makeButton(tag)
            button.addTarget(self, action: #selector(evento), for: .touchUpInside)
            row.addArrangedSubview(button)
            count += 1
        }
        
        contenedor.addArrangedSubview(row)
    }
    
    
    @objc func evento(_ btn: AnyObject) {
        
        let digito: String = btn.title(for: .normal)!
        
        switch digito {
            case "=":
                comprbarResutlado()
            case "AC":
                label.text = ""
            default:
                print(digito)
                addDigitosToLabel(digito)
        }
        
    }
    
    private func comprbarResutlado(){
        
        let operacionTexto = label.text
        let secciones = (operacionTexto?.split(separator: " "))?.count
        if (!(operacionTexto == nil) && secciones! >= 3){
            let resultado = Calculos.getOperation(operacionTexto!)
            label.text = "\(resultado)"
        }
    }
    private func addDigitosToLabel(_ digito: String){
        
        var operacionTexto = label.text ?? ""
        
        if (operacionTexto.count > 0){
            
            if(operacionTexto.last == " " && digito.contains(" ")){
                print("Ya hay un operador puesto")
            }else{
                operacionTexto += digito
            }
        }else{
            operacionTexto += digito
        }
        
        label.text = operacionTexto
    }

}

