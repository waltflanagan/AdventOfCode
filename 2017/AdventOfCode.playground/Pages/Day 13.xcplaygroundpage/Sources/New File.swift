import Foundation


class Layer {
    let depth: Int
    var zeroBasedDepth: Int {
        return depth - 1
    }
    private var _position = 0
    var phased: Bool {
        return ( _position / zeroBasedDepth ) % 2 == 0
    }
    
    var position: Int {
        let moduloPosition = _position % zeroBasedDepth
        return (phased ? moduloPosition : zeroBasedDepth - moduloPosition )
    }
    
    init(_ int: Int) {
        depth = int
    }
    
    func tick() {
        _position += 1
    }
}

public class Firewall {
     let layers: [Int: Layer]
    public var packet: Int = -1
    public var severity: Int = 0
    public let size: Int
    
    
    public func tick() {
        packet += 1
        
        //        print("packet - \(packet) -  \(layers[4]?.position)")
        if let layer = layers[packet], layer.position == 0 {
            //            print("ding \(packet)")
            severity += (packet * layer.depth)
        }
        
        spin()
    }
    
    public func spin() {
        layers.forEach({ $0.value.tick() })
    }
    
    public init(_ input: String) {
        let rows = input.components(separatedBy: "\n")
        
        var newLayers =  [Int: Layer]()
        
        rows.forEach { row in
            let parts = row.components(separatedBy: ": ")
            newLayers[Int(parts[0])!] = Layer(Int(parts[1])!)
        }
        
        layers = newLayers
        
        size = newLayers.keys.max() ?? 0
    }
}
