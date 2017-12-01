//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let a = (1,3)
let b = (3,4)

struct Location {
    var x: Int
    var y: Int
    
    init(_ value: (Int,Int)) {
        x = value.0
        y = value.1
    }
    
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    static func +(lhs: Location, rhs: Location) -> Location {

        let newX = max(min( 2, lhs.x + rhs.x), 0)
        let newY = max(min( 2, lhs.y + rhs.y), 0)
        return Location(newX, newY)
    }
    

}

let pad = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

extension Location: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(x),\(y)"
        
    }
    
    var padValue: String {
        return "\(pad[y][x])"
    }
}


enum Step: String {
    case U
    case D
    case L
    case R
    
    func value() -> Location {
        switch self {
        case .U: return Location(0,-1)
        case .D: return Location(0,1)
        case .L: return Location(-1,0)
        case .R: return Location(1,0)
        }
    }
}

var result = [String]()
for number in day2_instructions {
    var location: Location = Location(1,1)

    for d in number.characters {
        guard let s = Step(rawValue: String(d)) else {continue}
        
        location = location + s.value()
        
    }
   result.append( location.padValue )

}
result




//: [Next](@next)
