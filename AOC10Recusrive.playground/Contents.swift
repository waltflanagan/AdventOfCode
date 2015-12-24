//: Playground - noun: a place where people can play

import UIKit


var cache = [String : [Int]]()

func parseNumbers(numbers: [Int]) -> [Int] {
    let key = numbers.map { "\($0)" }.joinWithSeparator("")
    
    guard cache[key] == nil else {
        "cache hit"
        return cache[key]!
    }
    
    let (left, right) = split(numbers)
    
    let result: [Int]
    
    if let rightNumber = right.first where left.count == 0 {
        return [right.count, rightNumber]
    } else {
        var leftNumbers = parseNumbers(left)
        let rightNumbers = parseNumbers(right)
        leftNumbers.appendContentsOf(rightNumbers)
        result = leftNumbers
    }
    
    cache[key] = result
    
    return result
}

func split(numbers: [Int]) -> ([Int], [Int]) {
    
    let count = numbers.count
    var testLocation:Int = count / 2
    
    let testNumber = numbers[testLocation]
    
    while testLocation - 1 >= 0 &&
        testNumber == numbers[testLocation - 1] {
        testLocation -= 1
    }
    
    if count == 3 && numbers[0] != numbers[2] {
        let left = Array(numbers[0..<2])
        let right = [numbers[2]]
        
        return (left, right)
    } else {
        let left = Array(numbers[0..<testLocation])
        let right = Array(numbers[testLocation..<count])
        
        return (left, right)
    }
    

}

//var input: String = "331"

//var input: String = "31133333322113"
var input: String = "3113322113"

var numbers = Array(input.characters).map { Int("\($0)")!}
split(numbers)


for _ in 0..<40 {
    numbers = parseNumbers(numbers)
}
numbers.count


