//: Playground - noun: a place where people can play

import UIKit



struct Reindeer {
    let speed: Int
    let speedTime: Int
    let waitTime: Int
}

extension Reindeer: Equatable {}

func ==(lhs: Reindeer, rhs: Reindeer) -> Bool {
    return lhs.speed == rhs.speed && lhs.speedTime == rhs.speedTime && lhs.waitTime == rhs.waitTime
}

extension Reindeer: Hashable{
    var hashValue: Int {
        return speed ^ speedTime ^ waitTime
    }
}

var allDeer = [Reindeer]()

allDeer.append(Reindeer(speed: 22, speedTime: 8, waitTime: 165))
allDeer.append(Reindeer(speed: 8, speedTime: 17, waitTime: 114))
allDeer.append(Reindeer(speed: 18, speedTime: 6, waitTime: 103))
allDeer.append(Reindeer(speed: 25, speedTime: 6, waitTime: 145))
allDeer.append(Reindeer(speed: 11, speedTime: 12, waitTime: 125))
allDeer.append(Reindeer(speed: 21, speedTime: 6, waitTime: 121))
allDeer.append(Reindeer(speed: 18, speedTime: 3, waitTime: 50))
allDeer.append(Reindeer(speed: 20, speedTime: 4, waitTime: 75))
allDeer.append(Reindeer(speed: 7, speedTime: 20, waitTime: 119))


var distances = [Reindeer: Int]()
var points = [Reindeer: Int]()

for reindeer in allDeer {
    distances[reindeer] = 0
    points[reindeer] = 0
}

for i in 0..<2503 {
    for reindeer in allDeer {
        
        let tick = i % (reindeer.speedTime + reindeer.waitTime)
        
        if tick < reindeer.speedTime {
            distances[reindeer] = distances[reindeer]! + reindeer.speed
        }
    }
    
    var leaders = [Reindeer]()
    var max = 0
    
    for key in distances.keys {
        let distance = distances[key]!
        if distance >= max {
            max = distance
        }
    }
    

    for key in distances.keys {
        if let distance = distances[key] where distance == max {
            leaders.append(key)
        }
    }
    
    if leaders.count > 1 {
        leaders
    }
    
    for reindeer in leaders {
        points[reindeer] = points[reindeer]! + 1
    }
}
//MIN(distances.values)

//var max = 0
//
//for distance in distances.values {
//    if distance > max {
//        max = distance
//    }
//}
//
//max
//
distances

points

