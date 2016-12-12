import Foundation

public func countValidTriangles(triangles: [[Int]]) -> Int {
    
    let checked = triangles.map { (ints) -> Bool in
        let sorted = ints.sorted()
        return sorted[0] + sorted[1] > sorted[2]
    }
    
    
    let count = checked.filter { $0 }
    
   return count.count
}
