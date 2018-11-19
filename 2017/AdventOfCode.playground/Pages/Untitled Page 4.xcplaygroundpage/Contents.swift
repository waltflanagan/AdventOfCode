////: [Previous](@previous)
//
import Foundation

var f = [0]
f.insert(1, at: 1)
f.insert(2, at: 1)

f



//
////"p=< 4,0,0>, v=< 0,0,0>, a=<-2,0,0>"
////    .components(separatedBy: ", ")
////    .map( { $0.trimmingCharacters(in: CharacterSet(charactersIn: "avp=<> ")) })
////    .map({ $0.components(separatedBy: ",").map({ Int($0) }) })
////
////
//func transformsForSize(_ size: Int) -> [AffineTransform] {
//    let floatSize = CGFloat(size)/2.0
//    return [90, 180, 270, 360].flatMap { (degrees) in
//        return [(1, -1), (-1, 1)].map { (scale) in
//            var transform = AffineTransform()
//            transform.translate(x: floatSize, y: floatSize)
//            transform.rotate(byDegrees: CGFloat(degrees))
//            transform.scale(x: CGFloat(scale.0), y: CGFloat(scale.1))
//            transform.translate(x: -floatSize, y: -floatSize)
//            return transform
//        }
//    }
////
////    let flips:[AffineTransform] = [(1, -1), (-1, 1)].map { (scale) in
////        var transform = AffineTransform()
////        transform.translate(x: floatSize, y: floatSize)
////        transform.scale(x: CGFloat(scale.0), y: CGFloat(scale.1))
////        transform.translate(x: -floatSize, y: -floatSize)
////        return transform
////    }
////
////    return rotations.flatMap { rotation in
////        return flips.map { flip in
////            var newTransform = rotation
////            newTransform.append(flip)
////            return newTransform
////        }
////    }
//}
//
//Set(transformsForSize(3)).count
////transformsForSize(3).forEach({ print("\($0)")})
//
//let floatSize = CGFloat(1)/2.0
//
//var a = AffineTransform()
//a.translate(x: floatSize, y: floatSize)
//a.scale(x: 1, y: -1)
//a.rotate(byDegrees: CGFloat(90))
//a.translate(x: -floatSize, y: -floatSize)
//
//
//let test = a.transform( NSPoint(x: 1, y: 0) )
//
//print("a 1,0 -> \(test)")
//
//
////let index = 10
////
////switch index {
////case 2,3,5,6,10:
////    print("5")
////    fallthrough
////case 1,5,6,8,9,10:
////   print("10")
////default:
////    break
////}
////
////Int(0.9)
//
////: [Next](@next)

