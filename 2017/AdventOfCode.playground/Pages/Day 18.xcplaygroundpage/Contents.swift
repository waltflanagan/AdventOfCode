//: [Previous](@previous)

import Foundation

let channel = DuetChannel()
let p0 = Program(input, id: 0, pipe: channel.pipe1)
let p1 = Program(input, id: 1, pipe: channel.pipe2)

var tick0 = true
var tick1 = true
while tick0 && tick1 {
    if channel.pipe2.sendCount > 7000 {
        print("\(channel.pipe2.sendCount) -- \(channel.pipe1.sendCount)")
    } else if !(tick0 || tick1) {
        print("\(tick0) \(tick1)")
    }
   
    tick0 = p0.tick()
    tick1 = p1.tick()
    
}

print("---\(channel.pipe2.sendCount)---")

//: [Next](@next)
