//: [Previous](@previous)

import Foundation

let fakeInput = [[1, 1],
                 [1, 6],
                 [8, 3],
                 [3, 4],
                 [5, 5],
                 [8, 9]]
let realInput = [[81, 252],
                   [67, 186],
                   [206, 89],
                   [97, 126],
                   [251, 337],
                   [93, 101],
                   [193, 113],
                   [101, 249],
                   [276, 304],
                   [127, 140],
                   [289, 189],
                   [289, 264],
                   [79, 66],
                   [178, 248],
                   [91, 231],
                   [75, 157],
                   [260, 221],
                   [327, 312],
                   [312, 141],
                   [112, 235],
                   [97, 354],
                   [50, 200],
                   [192, 303],
                   [108, 127],
                   [281, 359],
                   [128, 209],
                   [50, 306],
                   [67, 314],
                   [358, 270],
                   [87, 122],
                   [311, 83],
                   [166, 192],
                   [170, 307],
                   [322, 320],
                   [352, 265],
                   [167, 342],
                   [296, 145],
                   [231, 263],
                   [340, 344],
                   [134, 132],
                   [72, 281],
                   [135, 352],
                   [140, 119],
                   [58, 325],
                   [247, 123],
                   [256, 346],
                   [330, 356],
                   [281, 177],
                   [216, 145],
                   [278, 98]]


let input = realInput


let coordinates = input.map { Point(x: $0.first!, y: $0.last!) }

//let areas = areasOf(coordinates)
//
//let sorted = areas.sorted { (left, right) -> Bool in
//    return left.value < right.value
//}
//print("\(sorted.map({ $0.value }))")


let region = safeRegion(coordinates)

//let closestCoordinate = coordinates.reduce(Point(x: 1000000, y: 1000000)) { (currentPoint, testPoint) -> Point in
//    return testPoint.distanceTo(smallestPoint) < currentPoint.distanceTo(smallestPoint) ? testPoint : currentPoint
//}


region




//: [Next](@next)
