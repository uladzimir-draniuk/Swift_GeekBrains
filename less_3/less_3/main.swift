//
//  main.swift
//  less_3
//
//  Created by elf on 24.12.2020.
//

/*
 Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.
 */
import Foundation

enum EngineAction {
    case start, stop
}
enum WindowsAction {
    case close, open
}
enum BagAction {
    case load (weight: Int)
    case unload (weight: Int)
}

enum BagState {
    case empty, not_empty
}

struct SportCar {
    let mark: String
    let data: Int
    let volBag: Int
    var engineStatus: EngineAction
    var bagStatus: BagState
    var windowsStatus: WindowsAction
    var bagAction: BagAction {
        get {
            return self.bagAction
        }
        set (newValue) {
            switch newValue {
            case .load : self.bagStatus = BagState.not_empty
            case .unload : self.bagStatus = BagState.empty
            }
        }
    }
}

struct TrunkCar {
    let mark: String
    let data: Int
    let volBag: Int
    var engineStatus: EngineAction
    var bagStatus: BagState
    var windowsStatus: WindowsAction
    var bagAction: BagAction {
        get {
            return self.bagAction
        }
        set (newValue) {
            switch newValue {
            case .load : self.bagStatus = BagState.not_empty
            case .unload : self.bagStatus = BagState.empty
            }
        }
    }
}

var car1 = SportCar(mark: "mazzerati", data: 1999, volBag: 100, engineStatus: EngineAction.stop, bagStatus: BagState.empty, windowsStatus: WindowsAction.close)

print (car1)

var car2 = TrunkCar(mark: "Scania", data: 2001, volBag: 60000, engineStatus: EngineAction.start, bagStatus: BagState.not_empty, windowsStatus: WindowsAction.close)

print (car2)


car1.bagAction = BagAction.load(weight: 40)

print (car1)


car2.bagAction = BagAction.unload(weight: 60000)

print (car2)


