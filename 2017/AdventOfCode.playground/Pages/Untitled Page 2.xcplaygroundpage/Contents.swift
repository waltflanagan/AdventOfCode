//: [Previous](@previous)

import Foundation

//let array = NSMutableArray(array: [1,0,1,0])
let array = NSMutableArray(array:[2, 8, 8, 5, 4, 2, 3, 1, 5, 5, 1, 2, 15, 13, 5, 14])

func redistributeArray() -> Int {
    var seen = NSMutableSet()
    var count = 0
    
    
    while !seen.contains(array) {
        seen.add(array.copy())
        
        var max = 0
        var maxIndex = 0
        for (index, value) in array.enumerated() {
            guard let value = value as? Int else { fatalError() }
            if value > max {
                max = value
                maxIndex = index
            }
        }
        
        array[maxIndex] = 0
        
        var workingIndex = maxIndex + 1
        
        for i in 0..<max {
            guard let workingValue = array[workingIndex % array.count] as? Int else { fatalError() }
            array[workingIndex % array.count] = workingValue + 1
            
            workingIndex += 1
        }
        
        count += 1
        array
//        break
    }
    
    return count
}

//redistributeArray()

//: [Next](@next)
