//: Playground - noun: a place where people can play

import UIKit

func parseNumbers(numbers: [Int]) -> [(Int, Int)] {
    
    var position = 0
    
    var result = [(Int, Int)]()
    
    while position < numbers.count {
    
        let currentNumber = numbers[position]
        var matchingRunLength = 1
    
        var nextPosition = position + 1
        
        while nextPosition < numbers.count && currentNumber == numbers[nextPosition] {
            matchingRunLength += 1
            position += 1
            nextPosition += 1
        }
        
        result.append((matchingRunLength, currentNumber))
        
        position += 1
    }
    
    return result
}


var baz: String = "3113322113"

var numbers = Array(baz.characters).map { Int("\($0)")!}
numbers

for _ in 0..<4 {
    var foo = parseNumbers(numbers)
    let bar = foo.flatMap { [$0.0, $0.1] }
    numbers = bar
}

numbers.count



