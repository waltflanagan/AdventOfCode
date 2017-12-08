import Foundation

var weights = [String:Int]()

public class Plate {
    public  let name: String
    public let weight: Int
    
    public var balanced: Bool {
        return Set<Int>( children.map({ ($0.realWeight) })).count < 2
    }
//    
//    public var realWeight: Int {
//        guard let cachedWeight = weights[name] else {
//            let realWeight = weight + children.reduce(0, { $0 + $1.realWeight })
//             weights[name] = realWeight
//            return realWeight
//        }
//        
//        return cachedWeight
//    }
    
    public var realWeight: Int {
        return weight + children.reduce(0, { $0 + $1.realWeight })
    }
    
    init(_ string: String) {
        let parts = string.trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
        
        name = parts[0]
        weight = Int(parts[1].trimmingCharacters(in: CharacterSet(charactersIn:"()")))!
    }
    
    public var children: [Plate] = []
}

extension Plate: Hashable {
    public var hashValue: Int {
        return name.hashValue
    }
}

public func ==(lhs: Plate, rhs:Plate) -> Bool {
    return lhs.name == rhs.name
}


public func plateTreeFrom(_ string: String) -> Plate {
    var allPlates = [String:Plate]()
    var pointedTo = Set<String>()
    var tree = [String:[String]]()
    
    let individualPlateStrings = string.components(separatedBy: "\n")
    var childrenNames = Set<String>()
    
    
    for plateString in individualPlateStrings {
        
        let components = plateString.components(separatedBy: "->")
        
        let plate = Plate(components[0])
        allPlates[plate.name] = plate
        
        if components.count == 2 {
            let otherPlates = components[1].trimmingCharacters(in: .whitespaces).components(separatedBy: ", ")
            tree[plate.name] = otherPlates
            
            otherPlates.forEach { childrenNames.insert($0) }
        }
    }
    
    var rootName: String?
    tree.forEach { allPlates[$0]!.children = $1.flatMap({ allPlates[$0] }); if !childrenNames.contains($0) { rootName = $0 } }
    
    return allPlates[rootName!]!
}
