//: [Previous](@previous)

import Foundation


go2()

var buffer = [0]
let steps = 3

var currentPosition = 0

for i in 1...9 {
    
    currentPosition = (currentPosition + steps) % (i)
    
    let insert = currentPosition + 1
    print(buffer)

    buffer.insert(i, at: insert )
    
    currentPosition = insert
}

print("\(buffer[(currentPosition + 1)])")

buffer
//: [Next](@next)
