import Foundation

let testInput = """
p=< 3,0,0>, v=< 2,0,0>, a=<-1,0,0>
p=< 4,0,0>, v=< 0,0,0>, a=<-2,0,0>
"""

struct Vector {
    let x: Int
    let y: Int
    let z: Int
    
    init(_ components:[Int]) {
        x = components[0]
        y = components[1]
        z = components[2]
    }
}

extension Vector: Hashable {
    var hashValue: Int {
        return x.hashValue ^ y.hashValue ^ z.hashValue
    }
}

func ==(lhs: Vector, rhs: Vector) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y && lhs.z == rhs.z
}

func +(lhs: Vector, rhs: Vector) -> Vector {
    return Vector([lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z])
}

class Particle {
    var position: Vector
    var velocity: Vector
    var acceleration: Vector
    
    init(_ string: String) {
        let components = string.components(separatedBy: ", ")
            .map( { $0.trimmingCharacters(in: CharacterSet(charactersIn: "avp=<> ")) })
            .map({ Vector($0.components(separatedBy: ",").map({ Int($0)! })) })
        
        position = components[0]
        velocity = components[1]
        acceleration = components[2]
    }
    
    func tick() {
        velocity = velocity + acceleration
        position = position + velocity
    }
    
    var distance: Int {
        return abs(position.x) + abs(position.y) + abs(position.z)
    }
    
}

let particles: [Particle] = input.components(separatedBy: "\n").map({ Particle($0) })
var particles2 = particles

public func go() {
    
    for _ in 0..<20000 {
        particles.forEach { $0.tick() }
        let offset = particles.enumerated().min(by: { $0.element.distance < $1.element.distance })?.offset

        
        if offset == 308 {
            return
        }
    }
}


public func start() {
    for _ in 0..<20000 {
        var collisions = [Vector: [Particle]]()

        particles2.forEach { (particle) in
            particle.tick()
            collisions[particle.position, default: []].append(particle)
        }
        
        
        particles2 = collisions.filter({ $0.value.count == 1 }).map({ $0.value.first! })
        print("\(particles2.count)")
    }
}
