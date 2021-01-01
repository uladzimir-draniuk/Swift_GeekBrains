//
//  main.swift
//  Lesson_5
//
//  Created by elf on 01.01.2021.
//

import Foundation

/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести сами объекты в консоль.
 */

enum EngineAction {
    case start, stop
}

enum WindowsAction {
    case close, open
}

enum BagState {
    case empty, not_empty
}

protocol Car {
    
    var mark: String {get set}
    var data: Int {get set}
    var volBag: Int {get set}
    var windowsState: WindowsAction {get set}
    var bagState: BagState {get set}
    var engineState: EngineAction {get set}
    
    func windowsAction(_ action: WindowsAction)
    func engineAction(_ action: EngineAction)
    func bagAction(_ action: BagState)
   
}

extension Car {
    
    mutating func windowsAction(_ action: WindowsAction) {
        self.windowsState = action
    }

    mutating func engineAction(_ action: EngineAction) {
        self.engineState = action
    }

    mutating func bagAction(_ action: BagState) {
        self.bagState = action
    }
}


class SportCar: Car {
    
    init(mark: String, data: Int, volBag: Int, windowsState: WindowsAction, bagState: BagState, engineState: EngineAction, maxSpeed: Int) {
        self.mark = mark
        self.data = data
        self.volBag = volBag
        self.windowsState = windowsState
        self.bagState = bagState
        self.engineState = engineState
        self.maxSpeed = maxSpeed
    }
    
    var mark: String
    var data: Int
    var volBag: Int
    var windowsState: WindowsAction
    var bagState: BagState
    var engineState: EngineAction
    
    func bagAction(_ action: BagState) {}
   
    func engineAction(_ action: EngineAction) {}
    
    func windowsAction(_ action: WindowsAction) {}
   
    var maxSpeed : Int
}

class TrunkCar: Car {
    
    var mark: String
    var data: Int
    var volBag: Int
    var windowsState: WindowsAction
    var bagState: BagState
    var engineState: EngineAction

    func bagAction(_ action: BagState) {}
 
    func engineAction(_ action: EngineAction) {}
    
    func windowsAction(_ action: WindowsAction) {}
    
    var maxCargo: Int
    
    init(mark: String, data: Int, volBag: Int, windowsState: WindowsAction, bagState: BagState, engineState: EngineAction, maxCargo: Int) {
        self.mark = mark
        self.data = data
        self.volBag = volBag
        self.windowsState = windowsState
        self.bagState = bagState
        self.engineState = engineState
        self.maxCargo = maxCargo
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "It is \(self.mark) sportCar with maxSpeed \(self.maxSpeed)"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "It is \(self.mark) trunkCar with maxCargo \(self.maxCargo)"
    }
}

var sportCar1 = SportCar(mark: "Ferrari", data: 2008, volBag: 50, windowsState: WindowsAction.close, bagState: BagState.empty, engineState: EngineAction.stop, maxSpeed: 250)

var trunkCar1 = TrunkCar(mark: "Scania", data: 2010, volBag: 50000, windowsState: WindowsAction.open, bagState: BagState.not_empty, engineState: EngineAction.stop, maxCargo: 56000)

var sportCar2 = sportCar1

var trunkCar2 = trunkCar1


print(sportCar2.maxSpeed)
print(sportCar1)

print(trunkCar2)
print(trunkCar1.maxCargo)



