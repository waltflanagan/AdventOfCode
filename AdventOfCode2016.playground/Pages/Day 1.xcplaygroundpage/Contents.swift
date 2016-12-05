//: Playground - noun: a place where people can play

import UIKit

let directionString = "R1, L3, R5, R5, R5, L4, R5, R1, R2, L1, L1, R5, R1, L3, L5, L2, R4, L1, R4, R5, L3, R5, L1, R3, L5, R1, L2, R1, L5, L1, R1, R4, R1, L1, L3, R3, R5, L3, R4, L4, R5, L5, L1, L2, R4, R3, R3, L185, R3, R4, L5, L4, R48, R1, R2, L1, R1, L4, L4, R77, R5, L2, R192, R2, R5, L4, L5, L3, R2, L4, R1, L5, R5, R4, R1, R2, L3, R4, R4, L2, L4, L3, R5, R4, L2, L1, L3, R1, R5, R5, R2, L5, L2, L3, L4, R2, R1, L4, L1, R1, R5, R3, R3, R4, L1, L4, R1, L2, R3, L3, L2, L1, L2, L2, L1, L2, R3, R1, L4, R1, L1, L4, R1, L2, L5, R3, L5, L2, L2, L3, R1, L4, R1, R1, R2, L1, L4, L4, R2, R2, R2, R2, R5, R1, L1, L4, L5, R2, R4, L3, L5, R2, R3, L4, L1, R2, R3, R5, L2, L3, R3, R1, R3"

//let directionString = "R1, L3, R5, R5"

directionString.characters.count

enum Direction: String {
    case L
    case R
    
    func transform() -> CGAffineTransform {
        switch self {
        case .L:
            return CGAffineTransform(a: 0, b: -1, c: 1, d: 0, tx: 0, ty: 0)
        case .R:
            return CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 0, ty: 0)

        }
    }
    
}



//
//
//enum CardinalDirection: String {
//    case north = "{0, 1}"
//    case south = "{0, 1}"
//    case east = "{1, 0}"
//    case west = "{-1, 0}"
//
//}


struct Step {
    let turn: Direction
    let distance: Int
}

func parse(string: String) -> [Step] {
    return []
}

public struct Map {
    
    let steps: [Step]
    
    public init(_ directionString: String) {
        
        let directions = directionString.components(separatedBy: ", ")
        
        var parsedSteps = [Step]()
        
        for direction in directions {
            let start = direction.startIndex
            let second = direction.index(after: start)
            let third = direction.endIndex

            guard let d = Direction(rawValue: direction.substring(with: start..<second)),
                let distance = Int(direction.substring(with: second..<third)) else {continue}
            
            let step = Step(turn: d, distance: distance)
            parsedSteps.append(step)
        }
        
        
        steps = parsedSteps
        
    }
    
    public func distance() -> Int {
        
        var direction = CGSize(width: 0, height: 1)
        
        var location = CGSize(width: 0, height: 0)
        
        for step in steps {
            direction = direction.applying(step.turn.transform())
            
            let stride = direction.applying(CGAffineTransform(scaleX: CGFloat(step.distance), y: CGFloat(step.distance)))
            
            location = stride + location
            
        }
        
        return abs(Int(location.width)) + abs(Int(location.height))
    }
    
    public func location() -> Int {
        
        var visited = Set<String>()
        var direction = CGSize(width: 0, height: 1)
        
        var location = CGSize(width: 0, height: 0)
        visited.insert(NSStringFromCGSize(location))
        
        for step in steps {
            direction = direction.applying(step.turn.transform())
            
          
            for _ in 0..<step.distance {
                location = direction + location
                 
                if visited.contains(NSStringFromCGSize(location)) {
                    NSLog("\(location)")
                    return abs(Int(location.width)) + abs(Int(location.height))
                } else {
                    visited.insert(NSStringFromCGSize(location))
                }
            }


        
        }
        
        return abs(Int(location.width)) + abs(Int(location.height))
    }

    
}

extension CGSize {
    static func +(lhs:CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
}


let map = Map(directionString)

map.location()


