import Foundation

public let testInput = """
../.# => ##./#../...
.#./..#/### => #..#/..../..../#..#
"""

public let input = """
../.. => ##./##./.##
#./.. => .../.#./##.
##/.. => .../.##/#.#
.#/#. => ##./#../#..
##/#. => .##/#.#/#..
##/## => ..#/.#./.##
.../.../... => #.../.##./...#/#...
#../.../... => ...#/..../..#./..##
.#./.../... => ..../.##./###./....
##./.../... => ###./#.##/..#./..#.
#.#/.../... => #.../.#../#..#/..#.
###/.../... => ..##/.##./#.../....
.#./#../... => #.##/..../..../#.##
##./#../... => .#.#/.#.#/##../.#..
..#/#../... => .###/####/.###/##..
#.#/#../... => ..../.#.#/..../####
.##/#../... => .##./##.#/.###/#..#
###/#../... => ####/...#/###./.###
.../.#./... => ..##/#..#/###./###.
#../.#./... => ###./..##/.#.#/.#.#
.#./.#./... => ..#./..#./##.#/##..
##./.#./... => #..#/###./..#./#.#.
#.#/.#./... => .###/#.../.#.#/.##.
###/.#./... => #.##/##../#.#./...#
.#./##./... => #.##/#.##/#.##/.###
##./##./... => ..##/#..#/.###/....
..#/##./... => #..#/.##./##../####
#.#/##./... => ###./###./..##/..##
.##/##./... => ###./##.#/.##./###.
###/##./... => ##../#..#/##../....
.../#.#/... => ##.#/..#./..##/##..
#../#.#/... => #..#/.###/.#../#.#.
.#./#.#/... => ####/#.##/.###/###.
##./#.#/... => #.../####/...#/.#.#
#.#/#.#/... => ...#/.#.#/#..#/#.##
###/#.#/... => ###./#.##/##.#/..##
.../###/... => ..../##.#/.#../..##
#../###/... => ####/..##/.##./.###
.#./###/... => #.#./#.#./#.../#..#
##./###/... => #..#/..##/#.##/#.#.
#.#/###/... => .##./##.#/.#../####
###/###/... => ####/##.#/.#../#.#.
..#/.../#.. => #..#/#.##/.###/.###
#.#/.../#.. => .##./#.../.#.#/....
.##/.../#.. => .#.#/.#.#/##../####
###/.../#.. => .#.#/.##./####/##.#
.##/#../#.. => .###/.###/.###/#...
###/#../#.. => ..##/#.../#.#./..#.
..#/.#./#.. => #.#./##../##../####
#.#/.#./#.. => ..../..##/#..#/..#.
.##/.#./#.. => #.##/#..#/##.#/.##.
###/.#./#.. => ...#/#.../#.#./.#..
.##/##./#.. => .##./#..#/.##./...#
###/##./#.. => ##.#/##.#/.##./...#
#../..#/#.. => ##../..#./..#./#.#.
.#./..#/#.. => #.#./##../#..#/#.##
##./..#/#.. => #.##/###./###./.#.#
#.#/..#/#.. => ..../...#/...#/#..#
.##/..#/#.. => #..#/#.#./..##/.##.
###/..#/#.. => ##../.#.#/.#../#.#.
#../#.#/#.. => ####/.##./.##./.##.
.#./#.#/#.. => ...#/.##./..#./.##.
##./#.#/#.. => .#.#/.##./..#./.#.#
..#/#.#/#.. => .#../##.#/##../#...
#.#/#.#/#.. => .#.#/..#./#.../##..
.##/#.#/#.. => ..#./#.#./###./#...
###/#.#/#.. => ..../#.#./..##/##.#
#../.##/#.. => .##./##../.#../..##
.#./.##/#.. => ##../#.#./#.../####
##./.##/#.. => ###./###./#.#./..##
#.#/.##/#.. => ...#/#..#/..#./###.
.##/.##/#.. => ..##/####/..../#.##
###/.##/#.. => .#.#/#.../.##./#...
#../###/#.. => ..#./.#.#/#..#/.##.
.#./###/#.. => ####/..../####/#.##
##./###/#.. => .###/..../#.#./####
..#/###/#.. => ###./#.#./.#.#/#...
#.#/###/#.. => #.#./#.#./..##/.##.
.##/###/#.. => #.##/.###/.##./#.##
###/###/#.. => #..#/.#../.#../.##.
.#./#.#/.#. => .#../.##./##../..##
##./#.#/.#. => .##./#.##/...#/#.#.
#.#/#.#/.#. => ##.#/###./#.#./..#.
###/#.#/.#. => ..../##../.###/###.
.#./###/.#. => .#.#/.###/..../#..#
##./###/.#. => #.../..#./#..#/.#..
#.#/###/.#. => .#../##.#/##.#/.###
###/###/.#. => #..#/.#.#/#.#./..#.
#.#/..#/##. => .#../.###/...#/#.##
###/..#/##. => ...#/...#/..##/...#
.##/#.#/##. => #.#./###./.##./####
###/#.#/##. => #.#./...#/...#/....
#.#/.##/##. => ###./#.../##.#/..#.
###/.##/##. => .#../#.../.###/.#..
.##/###/##. => #.../..#./..#./.###
###/###/##. => .#../.#../####/###.
#.#/.../#.# => ##.#/##../...#/##.#
###/.../#.# => ###./###./#..#/###.
###/#../#.# => .###/..#./.#../#...
#.#/.#./#.# => ##.#/.##./.#.#/##.#
###/.#./#.# => ...#/...#/#.##/.##.
###/##./#.# => #.../##../#.../....
#.#/#.#/#.# => ####/.#../..##/..##
###/#.#/#.# => ##../####/#.##/..##
#.#/###/#.# => ##../..../..../####
###/###/#.# => .#../.#.#/.###/.#.#
###/#.#/### => ##../####/###./...#
###/###/### => ###./#..#/##../.##.
"""

public struct Image: Equatable {
    public let storage: [[String]]
    
    public init(slashedImage string: String) {
        self.init(string, separator: "/")
    }
    
    public init(_ string: String, separator: String) {
        storage = Array(string.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: separator).map { $0.map { String($0) } }.reversed())
    }
    
    public init(_ image: String) {
        self.init(image, separator: "\n")
    }
    
    public init(_ storage: [[String]]) {
        self.storage = storage
    }
    
    public var brightness: Int {
        return  storage.reduce(0, { $0 + $1.reduce(0, { $0 + ($1 == "#" ? 1 : 0) }) })
    }
    
    public init(_ images: [[Image]]) {
        let empty = Image(Array(repeating:[String](), count: images.first!.first!.storage.count))
        
        let storage:[[String]] = images.reversed().map { row in
            let i: Image = row.reduce(empty, add)
            
            return i.storage
            }.reduce([[String]](), +)
        
        self.storage = Array(storage)
    }
    
    public func split() -> [[Image]] {
    
        let size = storage.count % 3 == 0 ? 3 : 2
        let originStride = stride(from: 0, to: storage.count, by: size)
        
        let images = originStride.reversed().map { y in
            originStride.map { x in
                return self[NSRect(x: x, y: y, width: size, height: size)]
            }
        }
        

        return images
    }
    
}



extension Image: CustomDebugStringConvertible {
    public var debugDescription: String {
        let rows = storage.reversed().map {
            return $0.joined(separator: "")
        }
        
        return "\n" + rows.joined(separator: "\n")
    }
    
    public var slashDescription: String {
        let rows = storage.reversed().map {
            return $0.joined(separator: "")
        }
        
        return rows.joined(separator: "/")
    }
}


public func add(_ lhs: Image, _ rhs: Image) -> Image {
    let storage: [[String]] = (0..<lhs.storage.count).map { i in
        let left = lhs.storage[i]
        let right = rhs.storage[i]
        
        return left + right
    }
    
    return Image(storage)
}

extension Image {
    subscript(_ point: NSPoint) -> String {
        return storage[Int(point.y)][Int(point.x)]
    }
    
    subscript(_ rect: NSRect) -> Image {
        var newImageStorage = [[String]]()
        
        for y in Int(rect.minY)..<Int(rect.maxY) {
            var row = [String]()
            for x in Int(rect.minX)..<Int(rect.maxX) {
                row.append(storage[y][x])
            }
//            newImageStorage.insert(row, at: 0)
            newImageStorage.append(row)
        }
        let ret = Image(newImageStorage)
        print("\(ret.debugDescription)")
        return ret
    }
}



func transformsForSize(_ size: Int) -> [AffineTransform] {
    let floatSize = CGFloat(size - 1)/2.0
    return [0, 90, 180, 270].flatMap { (degrees) in
        return [(1,1), (1, -1), (-1, 1)].map { (scale) in
            var transform = AffineTransform()

            transform.translate(x: floatSize, y: floatSize)
            transform.scale(x: CGFloat(scale.0), y: CGFloat(scale.1))

            transform.rotate(byDegrees: CGFloat(degrees))
            transform.translate(x: -floatSize, y: -floatSize)
        
            return transform
        }
    }
}


public func ==(lhs: Image, rhs: Image) -> Bool {
    guard lhs.storage.count == rhs.storage.count else { return false }
    
    let transforms = transformsForSize(lhs.storage.count)
    
    for (index, transform) in transforms.enumerated() {
        var match = true
        
        for row in 0..<lhs.storage.count {
            for column in 0..<lhs.storage[row].count {
                let point = NSPoint(x: column, y: row)
                
                var transformedPoint = transform.transform(point)
                
                transformedPoint = NSPoint(x: round(transformedPoint.x), y: round(transformedPoint.y))
                
//                if Int(transformedPoint.x) > lhs.storage.count - 1 || Int(transformedPoint.y) > lhs.storage.count - 1 {
//                    print("---\(index) \(NSStringFromPoint(point)), \(NSStringFromPoint(transformedPoint))    \(transform)---")
//                }

                if rhs[transformedPoint] != lhs[point] {
                    match = false
                }
            }
        }

        if match {

            return match
        }
    }
    

    return false
}


public let enhancements = input.components(separatedBy: "\n").map({ Array($0.components(separatedBy: " => ").map({ Image(slashedImage: $0) })) })

