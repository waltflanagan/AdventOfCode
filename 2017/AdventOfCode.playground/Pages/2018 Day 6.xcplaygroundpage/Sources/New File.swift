import Foundation

public struct Point {
    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    public let x: Int
    public let y: Int
    
    public func distanceTo(_ other: Point) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }
}

extension Point: Hashable {}

public func safeRegion(_ coordinates: [Point]) -> Int {
    
    let maxX = coordinates.reduce(0) { (result, point) -> Int in
        return max(result, point.x)
    }
    
    let maxY = coordinates.reduce(0) { (result, point) -> Int in
        return max(result, point.y)
    }
    
    let padding = 0
    
    let YBounds = maxY + padding
    let XBounds = maxX + padding
    
    var distances = [Point: Int]()
    
    for x in -padding..<XBounds {
        for y in -padding..<YBounds {
            let currentPoint = Point(x: x, y: y)
            
            let sumOfDistances = coordinates.map { $0.distanceTo(currentPoint) }.reduce(0, +)
            distances[currentPoint] = sumOfDistances
        }
    }
    
    
    let size = distances.filter({ $0.value < 10000}).count
    return size
//    return distances.reduce(Point(x: -1000, y: -1000), { (result, pair) -> Point in
//        return (pair.value < (distances[result] ?? 100000000)) ? pair.key : result
//    })
}

public func areasOf(_ coordinates: [Point]) ->  [Point: Int] {
    
    let maxX = coordinates.reduce(0) { (result, point) -> Int in
        return max(result, point.x)
    }
    
    let maxY = coordinates.reduce(0) { (result, point) -> Int in
        return max(result, point.y)
    }
    
    let padding = 100
    
    let YBounds = maxY + padding
    let XBounds = maxX + padding
    
    var areas = [Point: Int]()
    
    for x in -padding..<XBounds {
        for y in -padding..<YBounds {
            let currentPoint = Point(x: x, y: y)
            let distances = Dictionary(grouping: coordinates) { (point) -> Int in
                return point.distanceTo(currentPoint)
            }
            
            let closestPoints = distances.reduce((key: 100000, value: [])) { (result, pair) -> (key: Int, value: [Point]) in
                
                let useResult: Bool = (Int(result.key) < Int(pair.key))
                
                return useResult ? result : pair
            }
            
            if closestPoints.value.count == 1, let closestPoint = closestPoints.value.first {
                areas[closestPoint] = areas[closestPoint, default: 0] + 1
            }
        }
    }
    
 
    return areas
}
