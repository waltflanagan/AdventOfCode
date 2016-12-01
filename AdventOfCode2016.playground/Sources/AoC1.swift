import UIKit



//enum Direction: String {
//    case L
//    case R
//    
//    func transform() -> CGAffineTransform {
//        switch self {
//        case .L:
//            return CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
//        case .R:
//            return CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
//        }
//    }
//
//}
//
////
////
////enum CardinalDirection: String {
////    case north = "{0, 1}"
////    case south = "{0, 1}"
////    case east = "{1, 0}"
////    case west = "{-1, 0}"
////
////}
//
//
//struct Step {
//    let turn: Direction
//    let distance: Int
//}
//
//func parse(string: String) -> [Step] {
//    return []
//}
//
//public struct Map {
//    
//    let steps: [Step]
//    
//    public init(_ directionString: String) {
//        
//        let directions = directionString.components(separatedBy: " ")
//        
//        
//        var parsedSteps = [Step]()
//        
//        for direction in directions {
//            let start = direction.startIndex
//            let second = direction.index(after: start)
//            let third = direction.index(after: second)
//            
//            
//            guard let d = Direction(rawValue: direction.substring(with: start..<second)),
//                let distance = Int(direction.substring(with: second..<third)) else {continue}
//            
//            let step = Step(turn: d, distance: distance)
//            parsedSteps.append(step)
//        }
//        
//        
//        steps = parsedSteps
//        
//    }
//    
//    public func distance() -> Int {
//        
//        var direction = CGSize(width: 0, height: 1)
//        
//        var location = CGSize(width: 0, height: 0)
//        
//        for step in steps {
//            direction = direction.applying(step.turn.transform())
//            
//            let stride = direction.applying(CGAffineTransform(scaleX: CGFloat(step.distance), y: CGFloat(step.distance)))
//            
//            location = stride + location
//            
//        }
//        
//        return Int(location.width) + Int(location.height)
//    }
//
//}
//
//extension CGSize {
//    static func +(lhs:CGSize, rhs: CGSize) -> CGSize {
//        return CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
//    }
//}



