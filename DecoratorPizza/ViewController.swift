//
//  ViewController.swift
//  DecoratorPizza
//
//  Created by Kerim Khasbulatov on 26.12.2020.
//

import UIKit

class ViewController: UIViewController {
    //MARK: -- IBOutlets
    @IBOutlet weak var titlePizzaLbl: UILabel!
    @IBOutlet weak var pricePizzaLbl: UILabel!

    //MARK: -- Variables
    var comp: PizzaComponent?
    
    //MARK: -- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: -- Actions
extension ViewController {
    @IBAction func leftAction(_ sender: UIButton) {
        generateFirstPizza(with: sender.tag)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        generateSecondPizza(with: sender.tag)
    }
    
    @IBAction func randomGeneratePizza() {
        generateFirstPizza(with: Int.random(in: 1..<5))
        generateSecondPizza(with: Int.random(in: 1..<5))
    }
}

//MARK: -- Other Func
extension ViewController {
    func generateFirstPizza(with tag: Int) {
        switch tag {
        case 1:
            comp = Dodo()
        case 2:
            comp = DonBecon()
        case 3:
            comp = Pepperoni()
        case 4:
            comp = Cesar()
        default:
            print("default")
        }
        guard let comp = comp else {
            return
        }
        
        titlePizzaLbl.text = "Название: " + comp.getDescription()
        pricePizzaLbl.text = "Цена : " + String(comp.cost()) + "руб"
    }
    
    func generateSecondPizza(with tag: Int) {
        guard var comp = comp else {
            return
        }
        
        switch tag {
        case 1:
            comp = DodoExt(comp)
        case 2:
            comp = DonBeconExt(comp)
        case 3:
            comp = PepperoniExt(comp)
        case 4:
            comp = CesarExt(comp)
        default:
            print("default")
        }
        
        titlePizzaLbl.text = "Название: " + comp.getDescription()
        pricePizzaLbl.text = "Цена : " + String(comp.cost()) + "руб"
    }
}

