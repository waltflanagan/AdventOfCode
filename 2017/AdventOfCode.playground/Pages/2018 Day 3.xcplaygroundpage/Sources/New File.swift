import Foundation


extension CGRect {
    var points: [CGPoint] {
        var points = [CGPoint]()
        
        for xOffset in 0..<Int(size.width) {
            for yOffset in 0..<Int(size.height) {
                points.append(CGPoint(x: (Int(origin.x) + xOffset), y: (Int(origin.y) + yOffset) ))
            }
        }
        
        return points
    }
}

public struct Context {
    public init() {}
    let filled = NSCountedSet()
    
    public func add(_ rect: CGRect) {
        for point in rect.points {
            filled.add(point)
        }
    }
    
    public var overlapping: Int {
        var count = 0
        for object in filled.objectEnumerator() {
            if filled.count(for: object) > 1 {
                count += 1
            }
        }
        return count
    }
    
    public func rectOverlaps(_ rect: CGRect) -> Bool {
        for point in rect.points {
            if filled.count(for: point) > 1 {
                return true
            }
        }
        
        return false
    }
    
    public func addRects(_ rects: [CGRect]) {
        for rect in rects {
            add(rect)
        }
    }
}
