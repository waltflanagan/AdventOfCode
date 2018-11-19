import Foundation



struct Point {
    let x: Int
    let y: Int
    
    static let up = Point(x:0, y:1)
    static let down = Point(x:0, y:-1)
    static let left = Point(x:-1, y:0)
    static let right = Point(x:1, y:0)
    //    static let upRight = Point(x:1, y:1)
    //    static let downRight = Point(x:1, y:-1)
    //    static let upLeft = Point(x:-1, y:1)
    //    static let downLeft = Point(x:-1, y:-1)
    
    func rotatedRight() -> Point {
        switch self {
        case .up:
            return .right
        case .down:
            return .left
        case .right:
            return .down
        case .left:
            return .up
        default: fatalError()
        }
    }
    
    func rotatedLeft() -> Point {
        switch self {
        case .up:
            return .left
        case .down:
            return .right
        case .right:
            return .up
        case .left:
            return .down
        default: fatalError()
        }
    }
    
    func revereCourse() -> Point {
        switch self {
        case .up:
            return .down
        case .down:
            return .up
        case .right:
            return .left
        case .left:
            return .right
        default: fatalError()
        }
    }
    
    func adjacent() -> Set<Point> {
        let adjacents:[Point] = [.up, .down, .left, .right]
        
        return Set(adjacents.map({ self + $0 }))
    }
}

extension Point: CustomDebugStringConvertible {
    var debugDescription: String {
        return "(\(x), \(y))"
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

enum State: String {
    case weakened = "w"
    case clean = "."
    case infected = "#"
    case flagged = "f"
}

public func go() {
    let input = """
#..###...#..#.#.#...#..##
....#.##..#..###...###...
##.#.....###...#.##...###
##...#.####..#####..####.
##.#...#.##...##.....##.#
###.#.#...###..###.###...
#.#..#.#.###..#.##.#..###
.#..###.##..##.#....#.#..
#.#.......###.##...#.##..
#.#.######.##.#..#...#...
######.#.##...#.#...###.#
.#....#.###.##.######....
#.#####.#####.#.#..##.###
..##.#.#...###......###.#
.##.##..##.#.#.#######.##
#..###.###....#.....##..#
..##..####..##.#...####..
.##.####.##.##..##..#....
###...#.#..##...#.#..##..
......##.....#.#..#.#.###
#.#.##.##.#####....#.#..#
.....#.###.##...#...#..#.
#...#......##.##.#####.##
#.##.##.......#.##....#.#
####.##.#.#........###.##
"""
    
    
    
    
    var nodes = [Point: State]()
    
    let string = input
    let height = string.components(separatedBy: "\n").count
    
    string.components(separatedBy: "\n").enumerated().forEach({ thing in
        thing.element.enumerated().forEach({
            nodes[Point(x: $0.offset, y:(height - 1 - thing.offset) )] = State(rawValue: String($0.element))!
        })
    })
    
    
    let start = Point(x: 12, y: 12)
    var current = start
    var currentDirection: Point = .up
    var count = 0
    
    for _ in 0..<10000000 {
        
        let state = nodes[current] ?? .clean
        
        switch state {
        case .infected:
            currentDirection = currentDirection.rotatedRight()
            nodes[current] = .flagged
        case .clean:
            currentDirection = currentDirection.rotatedLeft()
            nodes[current] = .weakened
        case .weakened:
            nodes[current] = .infected
            count += 1
        case .flagged:
            nodes[current] = .clean
            currentDirection = currentDirection.revereCourse()
        }
        
        
        current = current + currentDirection
    }
    
    
    print(count)

}


