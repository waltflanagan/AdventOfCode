//: [Previous](@previous)

import Foundation




// 1 1 3 1 3 5 7
// (1 + 2) % 3 = 1
// (1 + 2) % 4 = 3
// (3 + 2) % 5 = 1
// (

var example1 = Game(players: 9, maxMarble: 50)
example1.play()


//
for pair in [(13,7999), (17,1104), (21,6111), (30,5807), (464,7091800)] {
    var example2 = Game(players: pair.0, maxMarble: pair.1)
    print("\(example2.play())")
}

//var realGame = Game(players: 464, maxMarble: 7091800)
//print("\(realGame.play())")









//: [Next](@next)
