//: Playground - noun: a place where people can play

import UIKit


enum Instruction {
    case On(CGPoint,CGPoint)
    case Off(CGPoint, CGPoint)
    case Toggle(CGPoint,CGPoint)
    
    init(string:String) {
        let components = string.componentsSeparatedByString(" ")
        switch components[0] {
        case "toggle":
            let points = Instruction.parseArguments(Array(components[1..<components.count]))
            self = .Toggle(points.0, points.1)
        default:
            let points = Instruction.parseArguments(Array(components[2..<components.count]))
            switch components[0] + components [1] {
            case "turnon": self = .On(points.0, points.1)
            case "turnoff": self = .Off(points.0, points.1)
            default: self = .Toggle(CGPointMake(0, 0), CGPointMake(0, 0))
            }
        }
    }
    
    static func pointFromString(string: String) -> CGPoint {
        let numbers = string.componentsSeparatedByString(",")
        
        return CGPointMake(CGFloat(Int(numbers[0])!), CGFloat(Int(numbers[1])!))
    }
    
    static func parseArguments(args: [String]) -> (CGPoint, CGPoint) {

        let first = pointFromString(args[0])
        let second = pointFromString(args[2])
        
        return (first,second)
    }
    
    
    
}

var lights = [[Bool]]()


for _ in 0..<10 {
    var row = [Bool]()
    for _ in 0..<10 {
        row.append(false)
    }
    lights.append(row)
}


func set(value: Bool, first: CGPoint, second: CGPoint) {
    
    for x in Int(first.x)..<Int(second.x) {
        for y in Int(first.y)..<Int(second.y) {
            lights[x][y] = value
        }
    }
}

func toggle(first: CGPoint, second: CGPoint) {
    
    for x in Int(first.x)..<Int(second.x) {
        for y in Int(first.y)..<Int(second.y) {
            lights[x][y] = !lights[x][y]
        }
    }
}


let input = ["turn on 3,2 through 8,7"]


let instructions = input.map { Instruction(string: $0) }

for instruction in instructions {
    
    switch instruction {
    case .Toggle(let first, let second): toggle(first,second:second)
    case .On(let first, let second): set(true, first:first, second:second)
    case .Off(let first, let second): set(false, first:first, second:second)
    }
}

var count = 0

for row in lights {
    for light in row {
        if light {
            count += 1
        }
    }
}

count






