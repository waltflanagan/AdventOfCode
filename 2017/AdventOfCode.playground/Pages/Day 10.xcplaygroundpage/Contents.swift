//: [Previous](@previous)

import Foundation

var testInput = Array(0..<256)
//let lengths = [88,88,211,106,141,1,78,254,2,111,77,255,90,0,54,205]

var lengths = "88,88,211,106,141,1,78,254,2,111,77,255,90,0,54,205".unicodeScalars.map { Int($0.value) }
lengths.append(contentsOf: [17,31,73,47,23])

var currentIndex = 0

var skipLength = 0

var currentArray = testInput

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




currentArray


testInput



//: [Next](@next)
