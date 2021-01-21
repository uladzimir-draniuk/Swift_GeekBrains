//
//  main.swift
//  less_7_and_6_too
//
//  Created by elf on 15.01.2021.
//

/*
    Задание:
 
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 
 */

import Foundation

/*
 -------------------------------------------------------------------------------
 Задание 7.1
 */

enum myError: Error {
    case unknownCity
    case isEmptyList
}

extension myError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .isEmptyList: return "Список городов пуст"
        case .unknownCity: return "Город отсутствует в списке"
        }
    }
}

class MyCityList {
    var citiesCountPeople = [
        "Lubek": 2000,
        "Oslo": 1459,
        "Aalborg": 1012
    ]
    
    func cityCountPeople (_ city: String) -> (count: Int?, error: myError?){
        guard let count = self.citiesCountPeople[city] else {
            return (nil, myError.unknownCity)
        }
        return (count, nil)
    }
    
    func averageCountPeople () -> (count: Int?, error: myError?) {
        
        guard self.citiesCountPeople.count > 0 else {
            return (nil, myError.isEmptyList)
        }
        
        var sum = 0
        for city in self.citiesCountPeople {
            sum += city.value
        }
        
        return (sum / self.citiesCountPeople.count, nil)
    }
    
    func pushCity (_ city: String, _ count: Int) {
        self.citiesCountPeople[city] = count
    }
    
    func deleteCity (_ city: String) {
        if let index = self.citiesCountPeople.index(forKey: city) {
            self.citiesCountPeople.remove(at: index)
        } else {
            print("Города \(city) не существует, возможно вы где-то ошиблись")
        }
    }
}

var cities = MyCityList()

let city1 = cities.cityCountPeople("Moskva")

if let count1 = city1.count {
    print("Выбранный вами город имеет численность \(count1) человек" )
} else if let error = city1.error {
    print(error.localizedDescription)
}

cities.citiesCountPeople = [:]

let result = cities.averageCountPeople()
if let count = result.count {
    print("Средняя численность населения всех городов в списке равна \(count)" )
} else if let error = result.error {
    print(error.localizedDescription)
}

cities.pushCity("Brest", 20000)
if let countBrest = cities.cityCountPeople("Brest").count {
    print("Выбранный вами город имеет численность \(countBrest) человек" )
} else if let error = cities.cityCountPeople("Brest").error {
    print(error.localizedDescription)
}

/*
 -------------------------------------------------------------------------------
 Задание 7.2
 */

enum myBookError: Error {
    case unknownBook
    case isEmptyList
}

extension myBookError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .isEmptyList: return "Список прочтенных книг пуст"
        case .unknownBook: return "Книга отсутствует в списке"
        }
    }
}

class ListBooks {
    var myList = [
        "Том Сойер": 325,
        "Финансист: Титан": 432,
        "Фаворит, часть 1": 634
    ]
    
    func totalCount () throws ->  Int {
        guard self.myList.count > 0 else {
            throw myBookError.isEmptyList
        }
        var sum = 0
        for pages in self.myList {
            sum += pages.value
        }
        return sum
    }
    
    func bookPages (_ book: String) throws -> Int {
        
        guard let mybook = self.myList[book] else {
            throw myBookError.unknownBook
        }
        return mybook.self
    }
}


var books = ListBooks ()

do {
    let pagesCount = try books.totalCount()
    print("За зиму я успел прочитать суммарно \(pagesCount) страниц ")
} catch let error {
    print(error.localizedDescription)
}

do {
    let nameBook = "Фаворит, часть 2"
    let bookPage = try books.bookPages(nameBook)
    print("Книга \(nameBook)  содержит \(bookPage) страниц ")
} catch let error {
    print(error.localizedDescription)
}

books.myList = [:]
do {
    let pagesCount = try books.totalCount()
    print("За зиму я успел прочитать суммарно \(pagesCount - pagesCount % 10) страниц ")
} catch let error {
    print(error.localizedDescription)
}




// ***************************************************************************************
print("**************************************** /n")
print("**************************************** /n")
print("**************************************** /n")
// ***************************************************************************************


/*
    Задание 6
 
     1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.

     2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

     3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    
 */

protocol Numberable {
    var number: Int { get }
    var weight: Double { get set }
}

class GreenApple: Numberable {
    
    var number: Int
    var weight: Double
    var radius: Double
    
    internal init(number: Int, weight: Double, radius: Double) {
        self.weight = weight
        self.radius = radius
        self.number = number
    }
        
    func calculateVolume () -> Double {
        return ((Double.pi * self.radius * self.radius) / 4.0)
        }
    }

class RedApple: Numberable {
    
    var number: Int
    var weight: Double
    var radius: Double
    
    internal init(number: Int, weight: Double, radius: Double) {
        self.weight = weight
        self.radius = radius
        self.number = number
    }
        
    func calculateVolume () -> Double {
        return ((Double.pi * self.radius * self.radius) / 4.0)
        }
    }

struct Stack<T: Numberable> {
    
    private var fruits: [T] = []
       
    mutating func push(_ element: T) {
        fruits.append(element)
    }

    mutating func pop() -> T? {
        return self.fruits.isEmpty ? .none : self.fruits.removeLast()
    }

    func totalWeght() -> Double {
        var weight = 0.0
        for fruit in fruits {
            weight += fruit.weight
        }
        return weight
    }
    
    subscript(indice: UInt) -> T? {
        
        if indice < fruits.count {
            return fruits[Int(indice)]
        } else {
            print("Stack hasn't element with index = \(indice)")
            return nil
        }
    }
    
    func checkWeightFruit (element: T, checkWeight: Double) -> Bool {
        return element.weight <= checkWeight
    }
    
    func checkByNumber (element: T, checkNumber: Int) -> Bool {
        return element.number <= checkNumber
    }
    
    func filterByMaxWeight (maxWeight: Double, checkFunc: (T, Double) -> Bool ) -> Stack<T> {
        var result = Stack<T>()
        for fruit in self.fruits {
            if checkFunc(fruit, maxWeight) {
                result.push(fruit)
            }
        }
        return result
    }
    
    func filterByMaxNumber (maxNumber: Int, checkFunc: (T, Int) -> Bool) -> Stack<T> {
        var result = Stack<T>()
        for fruit in self.fruits {
            if checkFunc(fruit, maxNumber) {
                result.push(fruit)
            }
        }
        return result
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
       
        var string: String = ""
        if fruits.isEmpty {
            return "Stack is empty"
        } else {
            for fruit in fruits {
                string += "\(fruit.number)--"
            }
            return string
        }
    }
}

    
var myStack = Stack<GreenApple>()
print(myStack)

myStack.push(GreenApple(number: 1, weight: 125, radius: 12))
print(myStack)

myStack.push(GreenApple(number: 5, weight: 101, radius: 10))
print(myStack)

print(myStack[5])

myStack.push(GreenApple(number: 3, weight: 370, radius: 10))
myStack.push(GreenApple(number: 10, weight: 420, radius: 10))
myStack.push(GreenApple(number: 99, weight: 178, radius: 10))
myStack.push(GreenApple(number: 55, weight: 351, radius: 10))
myStack.push(GreenApple(number: 7, weight: 250, radius: 10))


let filterByWeieght = myStack.filterByMaxWeight(maxWeight: 300, checkFunc: myStack.checkWeightFruit)
print(filterByWeieght)

let filterByNumber = myStack.filterByMaxNumber(maxNumber: 50, checkFunc: myStack.checkByNumber)
print(filterByNumber)

    

