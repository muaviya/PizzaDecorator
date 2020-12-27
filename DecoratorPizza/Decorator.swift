//
//  Decorator.swift
//  DecoratorPizza
//
//  Created by Kerim Khasbulatov on 26.12.2020.
//

import Foundation
/*
Определяем интерфейс для объектов, на которые могут быть динамически
возложены дополнительные обязанности
 
Компонент может использваться сам по себе, так и "завернутым" в декоратор
 */
protocol PizzaComponent {
    func getDescription() -> String
    func cost() -> Double
}


/*определяет объекты, на который возлагается дополнительные обязанности
 ConcreteComponent - объект, поведение которого мы собираемся расширять динамически.
 */
class Dodo: PizzaComponent {
    func getDescription() -> String {
        "Dodo"
    }
    
    func cost() -> Double {
        return 330
    }
}

class DonBecon: PizzaComponent {
    func getDescription() -> String {
        "DonBecon"
    }
    
    func cost() -> Double {
        return 290
    }
}

class Pepperoni: PizzaComponent {
    func getDescription() -> String {
        "Pepperoni"
    }
    
    func cost() -> Double {
        return 390
    }
}

class Cesar: PizzaComponent {
    func getDescription() -> String {
        "Cesar"
    }
    
    func cost() -> Double {
        return 210
    }
}

/*  Интерфейс Декоратор
    хранит ссылку на объект PizzaComponent
    и определяет интерфейс, соответствующий интерфейсу PizzaComponent*/
protocol PizzaDecorator: PizzaComponent {
    var component: PizzaComponent { get set }
}

/*  Конкретный Декоратор
    Выполняют основную задачу + дополнительную.
*/
class DonBeconExt: PizzaDecorator {
    var component: PizzaComponent
    
    init(_ component: PizzaComponent) {
        self.component = component
    }
    
    func getDescription() -> String {
        component.getDescription() + " на пару с " + "DonBecon"
    }
    
    func cost() -> Double {
        component.cost() + 290
    }
}


class DodoExt: PizzaDecorator {
    var component: PizzaComponent
    
    init(_ component: PizzaComponent) {
        self.component = component
    }
    
    func getDescription() -> String {
        component.getDescription() + " на пару с " + "Dodo"
    }
    
    func cost() -> Double {
        component.cost() + 330
    }
}

class PepperoniExt: PizzaDecorator {
    var component: PizzaComponent
    
    init(_ component: PizzaComponent) {
        self.component = component
    }
    
    func getDescription() -> String {
        component.getDescription() + " на пару с " + "Pepperoni"
    }
    
    func cost() -> Double {
        component.cost() + 390
    }
}


class CesarExt: PizzaDecorator {
    var component: PizzaComponent
    
    init(_ component: PizzaComponent) {
        self.component = component
    }
    
    func getDescription() -> String {
        component.getDescription() + " на пару с " + "Cesar"
    }
    
    func cost() -> Double {
        component.cost() + 210
    }
}
