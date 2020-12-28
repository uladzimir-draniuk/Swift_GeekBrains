//
//  main.swift
//  Less_4
//
//  Created by elf on 28.12.2020.
//

import Foundation

/*
 . Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
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

class Car {
    internal init(mark: String, data: Int, volBag: Int, engineStatus: EngineAction, bagStatus: BagState, windowsState: WindowsAction) {
        self.mark = mark
        self.data = data
        self.volBag = volBag
        self.engineStatus = engineStatus
        self.bagStatus = bagStatus
        self.windowsState = windowsState
    }
    
    var mark: String
    var data: Int
    var volBag: Int
    var engineStatus: EngineAction
    var bagStatus: BagState
    var windowsState: WindowsAction
    
}

enum SpeedAction {
    case speedUp (speed: Int)
    case speedDown (speed: Int)
}

class SportCar : Car {
    var speed : Int = 0
    func speedAction(_ action: SpeedAction) {
        switch action {
        case .speedUp(speed: let speed) :
            if (self.speed + speed) <= 250 {
                self.speed += speed
            } else {
                print ("Повышение текущей скорости \(self.speed)км/ч на \(speed) будет превышать максимально допустимую скорость 250км/ч")
            }
        case .speedDown(speed: let speed) :
            if self.speed >= speed {
                self.speed -= speed
            } else {
                print ("Текущая скорость \(self.speed) км/ч не может быть снижена на \(speed)")
            }
        }
    }
}

enum CargoAction {
    case loadCargo (weight: Int)
    case unloadCargo (weight: Int)
}



class TrunkCar : Car {
    var cargo : Int = 0
    func cargoAction(_ action: CargoAction) {
        switch action {
        case .loadCargo(weight: let weight):
            if (self.cargo + weight) <= self.volBag {
                self.cargo += weight
            } else {
                print("Не допустимая загрузка -- превышен максимальный вес!!!")
            }
        case .unloadCargo(weight: let weight):
            if (self.cargo - weight) < 0 {
                print("В грузовике меньше груза (\(self.cargo)) чем планируется выгрузить (\(weight))")
            } else {
                self.cargo -= weight
            }
        }
    }
}

var sportCar1 = SportCar(mark: "Ferrari", data: 2008, volBag: 50, engineStatus: EngineAction.start, bagStatus: BagState.empty, windowsState: WindowsAction.close)

var trunkCar1 = TrunkCar(mark: "Scania", data: 2010, volBag: 50000, engineStatus: EngineAction.stop, bagStatus: BagState.not_empty, windowsState: WindowsAction.close)

var sportCar2 = sportCar1

var trunkCar2 = trunkCar1

sportCar1.speedAction(SpeedAction.speedUp(speed: 300))

sportCar1.speedAction(SpeedAction.speedUp(speed: 150))

print(sportCar2.speed)

print(trunkCar2.cargo)

trunkCar1.cargoAction(CargoAction.loadCargo(weight: 30000))

print(trunkCar2.cargo)

trunkCar1.cargoAction(CargoAction.loadCargo(weight: 30000))

