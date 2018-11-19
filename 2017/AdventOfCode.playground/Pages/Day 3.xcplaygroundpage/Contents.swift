//: [Previous](@previous)

import Foundation

struct Point {
    let x: Int
    let y: Int
    
    static let up = Point(x:0, y:1)
    static let down = Point(x:0, y:-1)
    static let left = Point(x:-1, y:0)
    static let right = Point(x:1, y:0)
    static let upRight = Point(x:1, y:1)
    static let downRight = Point(x:1, y:-1)
    static let upLeft = Point(x:-1, y:1)
    static let downLeft = Point(x:-1, y:-1)
    
    func adjacent() -> [Point] {
        let adjacents:[Point] = [.up, .down, .left, .right, .upRight, .downRight, .upLeft, .downLeft]
        
        return adjacents.map({ self + $0 })
    }
}

extension Point: Hashable {
    var hashValue: Int {
        return "\(x),\(y)".hashValue
    }
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

func +(left: Point, right: Point) -> Point {
    return Point(x: left.x + right.x, y: left.y + right.y)
}



func runningValueGreaterThan(_ number: Int) -> Int {
    
    var sideSize = 1
    var position = Point(x:0, y:0)
    var direction:Point = .right
    var place = 0
    
    var storage = [Point:Int]()
    storage[Point(x:0, y:0)] = 1

    
    func nextDirection() -> Point {
        switch (direction.x, direction.y) {
        case (-1,0): return .down
        case (1,0): return .up
        case (0,1): return .left
        case (0,-1): return .right
        default: fatalError()
        }
    }
    
    var lastValue = 1
    
    while lastValue <= number {
        for _ in 0..<2 {
            for _ in 0..<sideSize {
                guard lastValue <= number else { break }
                
                if storage[position] == nil {
                    var value = 0
                    for point in position.adjacent() {
                        value += storage[point] ?? 0
                    }
                    
//                    position.adjacent().flatMap { storage[point] }.reduce(0) { $0 + $1 }
//
//                    storage[position] = position.adjacent().flatMap { storage[point] }.reduce(0) { $0 + $1 }                   lastValue = value
                }
              
                position = position + direction
                place += 1
            }
            
            direction = nextDirection()
        }
        sideSize += 1
    }
    
    return lastValue
}

func positionOf(_ number: Int) -> Point {
    
    var sideSize = 1
    var position = Point(x:0, y:0)
    var direction:Point = .right
    var value = 0
    
    func nextDirection() -> Point {
        switch (direction.x, direction.y) {
        case (-1,0): return .down
        case (1,0): return .up
        case (0,1): return .left
        case (0,-1): return .right
        default: fatalError()
        }
    }

    while value < (number - 1) {
        for _ in 0..<2 {
            for _ in 0..<sideSize {
                guard value < (number - 1) else { break }
                position = position + direction
                value += 1
            }
            direction = nextDirection()
        }
        sideSize += 1
    }

    return position
}

runningValueGreaterThan(325489)
//: [Next](@next)
