//
//  main.swift
//  Lesson_2
//
//  Created by elf on 17.12.2020.
//  Copyright © 2020 elf. All rights reserved.
//

import Foundation

// Задание 1. Написать функцию, которая определяет, чётное число или нет.


func isEven (num: Int) -> Bool {
    if num == 0 || num % 2 != 0 {
        return false
    }
    return true
}

// Задание 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func isMultipleOfThree (num : Int) -> Bool {
    if num != 0 && num % 3 == 0 {
        return true
    }
    return false
}


// Задание 3. Создать возрастающий массив из 100 чисел

var arr100 = [Int]()
for i in 0..<100 {
    arr100.append(i)
}

print("Задание 3. \n Результат: \(arr100)")


// Задание 4. Удалить из этого массива все чётные числа и все числа, которые не делятся на 3
var j = 0
repeat {
    
    if isEven(num: arr100[j]) || !isMultipleOfThree(num: arr100[j]){
        arr100.remove(at: j)
    } else {
        j += 1
    }
} while j < arr100.count

print("Задание 4. \n Результат: \(arr100)")


// Задание 5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи неё 100 элементов

func addFibonachi (arr: [Int]) -> Int {
    return (arr[arr.count - 1] + arr[arr.count - 2])
}

// делаем проверку размера массива прежде чем вызвать функцию
if arr100.count >= 2 {
    for _ in 0..<100 {
        arr100.append(addFibonachi(arr: arr100))
        if addFibonachi(arr: arr100) >= Int32.max {
            print ("Получаемое следующее число Фибоначи выходит за пределы размера Int32! \n Осуществляем выход из цикла")
            break
        }
        
    }
}

print("Задание 5. \n Результат: \(arr100)")


// Задание 6. Заполнить массив из 100 элементов различными простыми числами. Для нахождения простых чисел используем метод Эратосфена
func createArrSequence (size: Int) -> [Int] {
    var arrSequence = [Int]()

    for i in 2..<size {
        arrSequence.append(i)
    }
    return arrSequence
}

func stepEratosphen (arr: [Int], step: Int) ->  [Int] {

    var removedNum = step + step
    var arrAfterStep = arr
    repeat
    {
        for (index, value) in arrAfterStep.enumerated() {
            if value == removedNum {
                arrAfterStep.remove(at: index)
                break
            }
        }
        removedNum += step
      
    } while removedNum < arrAfterStep.endIndex
    
    return arrAfterStep
}

func findBigger (arr: [Int], x: Int) -> (Bool, Int) {
    for (index, value) in arr.enumerated() {
        if value > x {
            return (true, index)
        }
    }
    return (false, 0)
}

func getSimpleNumber (n: Int, arrSize: Int) {

    var arrSimple = [Int] ()
    var p = 2

    var seqArr = createArrSequence(size: n)
    var resFindNewP: (Bool, Int)

    repeat {
        
        seqArr = stepEratosphen(arr: seqArr, step: p)
        resFindNewP = findBigger(arr: seqArr, x: p)
        if resFindNewP.0 {
            p = seqArr[resFindNewP.1]
        } else {
            break
        }
    } while resFindNewP.0 //&& seqArr[0] >= p)
    
    // Вывод результата на экран

    if seqArr.count < arrSize {
        print ("К сожаление количество простых чисел в предложенном диапазоне \(n) оказалось меньше требуемого размера массива \(arrSize)")
        print (seqArr)
    } else {
        if seqArr.count >= arrSize {
            for z in 0...arrSize {
                arrSimple[z] = seqArr[z] // Вы этом месте какая-то хрень и ошибка, почему - за час так и не понял
            }
        }
        print ("Искомое количество простых чисел в предложенном диапазоне \(n) :\n")
        print (arrSimple)

    }
}

    getSimpleNumber(n: 500, arrSize: 100)




