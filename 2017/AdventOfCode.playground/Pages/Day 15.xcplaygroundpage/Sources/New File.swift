import Foundation

struct Generator {
    var previousValue: UInt
    var seed: UInt
    
    mutating func generate() -> UInt {
        let newValue = (previousValue * seed) % 2147483647
        
        previousValue = newValue
        return newValue
    }
    
    mutating func generateUntilMultipleOf(_ multiple: UInt) -> UInt {
        var result = generate()
        while (result % multiple) != 0 {
            result = generate()
        }
        return result
    }
}

func compare(_ left: UInt, _ right: UInt) -> Bool {
    let leftBits = left & UInt(UInt16.max)
    let rightBits = right & UInt(UInt16.max)
    return leftBits == rightBits
}

var generatorA = Generator(previousValue: 516, seed: 16807)
var generatorB = Generator(previousValue: 190, seed: 48271)

//var generatorA = Generator(previousValue: 65, seed: 16807)
//var generatorB = Generator(previousValue: 8921, seed: 48271)

public func runIterations_part1(_ count: UInt) -> UInt {
    var matches: UInt = 0
    for _ in 0..<count {
        let a = generatorA.generate()
        let b = generatorB.generate()
        
        if compare(a,b) {
            matches += 1
        }
    }
    return matches
}


public func runIterations_part2(_ count: UInt) -> UInt {
    var matches: UInt = 0
    for _ in 0..<count {
        let a = generatorA.generateUntilMultipleOf(4)
        let b = generatorB.generateUntilMultipleOf(8)
        
        if compare(a,b) {
            matches += 1
        }
    }
    return matches
}



