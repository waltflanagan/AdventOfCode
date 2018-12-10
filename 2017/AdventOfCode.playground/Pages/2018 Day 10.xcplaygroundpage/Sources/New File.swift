import Foundation

// should be `<X, Y>` format
func numbersFrom(_ string: String) -> (Int, Int) {
    let justNumbers = string.trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
    let components = justNumbers.components(separatedBy: ",")
    let numbers: [Int] = components.map({ string in
        let trimmed = string.trimmingCharacters(in: .whitespaces )
        return Int(trimmed)!
    })
    
    return (numbers.first!, numbers.last!)
}


public struct Point {
    public let x: Int
    public let y: Int
    
    public let velocity: (Int, Int)
    
    public init(_ row: String) {
        
        let chopped = row.dropFirst("position=".count)
        let compontents = chopped.components(separatedBy: " velocity=")
        
        let numberComponents = compontents.map(numbersFrom)
        
        let position = numberComponents.first!
        
        x = position.0
        y = position.1
        
        velocity = numberComponents.last!
    }
    
    
    public init(x: Int, y: Int, velocity: (Int, Int)) {
        self.x = x
        self.y = y
        self.velocity = velocity
    }
    
    public func byMoving() -> Point {
        return Point(x: x + velocity.0, y: y + velocity.1, velocity: velocity)
    }
}

public struct Rect {
    public var minX: Int = Int.max
    public var minY: Int = Int.max
    public var maxX: Int = Int.min
    public var maxY: Int = Int.min
    
    public init() {}
    public mutating func addPoint(_ point: Point) {
        maxX = max(point.x, maxX)
        maxY = max(point.y, maxY)
        minX = min(point.x, minX)
        minY = min(point.y, minY)
    }
    
    public var size: Int {
        return (maxX - minX) * (maxY - minY)
    }
}


public class Context {
    public var currentPoints: [Point]
    public var currentTime = 0
    public var smallestTime = Int.max
    public var smallestArea = Int.max
    public var history: [Int: [Point]] = [:]
    
    public init(_ points: [Point]) {
        self.currentPoints = points
    }
    
    public func run() -> [Point] {
        for i in 0..<100_000 {
            
            if i % 1000 == 0 {
                print("\(i)")
            }
            
            currentTime += 1
            currentPoints = currentPoints.map({ $0.byMoving() })
            history[currentTime] = currentPoints
            
            var rect = Rect()
            currentPoints.forEach { rect.addPoint($0) }
            
            if rect.size < smallestArea {
                smallestArea = rect.size
                smallestTime = currentTime
                //        print(" \(smallestTime) - \(smallestArea) ")
                
                //        visualize(currentPoints)
                //        view
            }
        }
        
        print("----------\(smallestTime)")
        return history[smallestTime]!
    }
}
