//: [Previous](@previous)

import Foundation

func hash(input: [String])  {
    var currentIndex = 0
    
    var skipLength = 0
    
    var currentArray = input
    
    for _ in 0..<64 {
        for length in lengths {
            
            var result = currentArray
            
            let flipIndex = currentIndex + length
            
            let sliceRange = currentIndex..<flipIndex
            
            let zipped = zip(sliceRange.reversed(), sliceRange)
            
            for (source, destination) in zipped {
                result[destination % testInput.count] = currentArray[source % testInput.count]
            }
            
            currentIndex = flipIndex + skipLength
            skipLength += 1
            
            currentArray = result
            
        }
        
    }
    
    var dense = [Int]()
    
    for i in 0..<16 {
        let start = i * 16
        let end = start + 16
        
        let slice = currentArray[start..<end]
        
        let hash = slice.reduce(0, ^)
        dense.append(hash)
    }
    
    dense.reduce("") { (string, hash) -> String in
        return string + String(format:"%2X", hash)
    }
}
//: [Next](@next)
