//: [Previous](@previous)

import Foundation

struct Instruction {
    let name: String
    let rect: CGRect
    init(aocString: String) {
        let components = aocString.components(separatedBy: " @ ")
        name = components.first!
        rect = CGRect(aocString: components.last!)
    }
}

let f = #fileLiteral(resourceName: "instructions.txt")
f
let contents = try! NSString(contentsOf: f, encoding: String.Encoding.utf8.rawValue)
let rows = contents.trimmingCharacters(in: .newlines).components(separatedBy: .newlines)
let instructions = rows.map { Instruction(aocString: $0) }



    
extension CGPoint {
    init(aocString: String) {
        let components = aocString.components(separatedBy: ",")
        let x = Int(components.first!)!
        let y = Int(components.last!)!
        self.init(x: x, y: y)
    }
}

extension CGSize {
    init(aocString: String) {
        let components = aocString.components(separatedBy: "x")

        let width = Int(components.first!)!
        let height = Int(components.last!)!
        self.init(width: width, height: height)
    }
}


extension CGRect {
    init(aocString: String) {
        let components = aocString.components(separatedBy: ": ")   //"922,417"
        let coordinateString = components.first!
        let sizeString = components.last!
        
        self.init(origin: CGPoint(aocString: coordinateString), size: CGSize(aocString: sizeString))
    }
}

extension CGPoint: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(Int(x))
        hasher.combine(Int(y) * 100_000_000)
    }
}


let rects = instructions.map({ $0.rect })
let context = Context()
context.addRects(rects)
context.overlapping
let name = instructions.filter({ !context.rectOverlaps($0.rect) }).first?.name
name


//: [Next](@next)
