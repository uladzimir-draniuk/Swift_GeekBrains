//
//  main.swift
//  less_6
//
//  Created by elf on 11.01.2021.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 
 */

protocol Weightable {
    var weight: Double { get set }
}


class Apple:Weightable {
    var weight: Double
    
    internal init(weight: Double, radius: Double) {
        self.weight = weight
        self.radius = radius
    }
    
    var radius: Double
    
    func culculateVolume(_ rad: Double) -> Double {
        return ((Double.pi * rad * rad) / 4.0)
    }
}

struct Stack<T: Weightable> {
    var weight: Double
    
    private var elements: [T] = []
        
    mutating func push(_ element: T) {
        elements.append(element)
    }

    mutating func pop() -> T? {
        return elements.removeLast()
    }

    var totalWeght : Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    
    subscript(indices: UInt ...) -> Double {
            var weight = 0.0
            for index in indices where index < self.elements.count {
                weight += self.elements[Int(index)].weight
            }
            return weight
        }
    func filter(minRad: Double, maxRad: Double) {
           // 
    }
}


