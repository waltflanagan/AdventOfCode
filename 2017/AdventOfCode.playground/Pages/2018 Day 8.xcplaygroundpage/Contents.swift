//: [Previous](@previous)

import Foundation
let fakeInput = "2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2"
let input = realInput
let inputNumbers = input.components(separatedBy: " ").map({ Int($0)! })


func pront(_ string: String) {
//    print(string)
}


struct Header {
    let childCount: Int
    let metadataCount: Int
    
    init(_ array: [Int])  {
        childCount = array[0]
        metadataCount = array[1]
    }
}

struct Node {
    let children: [Node]
    let metadata: [Int]
    
    var weight: Int {
        return metadata.reduce(0,+) + children.map({$0.weight}).reduce(0, +)
    }
    
    var value: Int {
        guard children.count > 0 else {
            return weight
        }
        var sum = 0
        for i in metadata {
            var theIndex = i - 1
            if (0..<children.count).contains(theIndex) {
                sum += children[theIndex].value
            }
        }
        return sum
    }
    
    
    static func chopHeader(in array:[Int]) -> (Header, [Int]) {
        let header = Header(array)
        return (header, Array(array.dropFirst(2)))
    }
    
    static func parseNextNode(in array:[Int]) -> (Node, [Int]?) {
        let (header, body) = chopHeader(in: array)
        
        pront("parsing - \(body)")
        
        guard header.childCount > 0 else {
            var remainder = body
            var metadata = [Int]()
            
            if header.metadataCount > 0 {
                metadata = Array(body[0..<header.metadataCount])
                remainder = Array(body.dropFirst(header.metadataCount))
                pront("remainder going up - \(remainder)")
            }
             pront("metadata - \(metadata)")
            return (Node(children: [], metadata: metadata), remainder)
        }
        
        var children = [Node]()
        
        var remainder: [Int]? = body
        for i in 0..<header.childCount {
            pront("creating child - \(i)")
           let (nextNode, nextRemainder) =  parseNextNode(in: remainder!)
            remainder = nextRemainder
            
            pront("equal - \(remainder == nextRemainder) ")
            
            children.append(nextNode)
        }
    
        
        let metadata: [Int] = {
            guard header.metadataCount > 0 else { return [] }
       
            let metadata = Array(remainder![0..<header.metadataCount])
            pront("metadata - \(metadata)")
            remainder = Array(remainder!.dropFirst(header.metadataCount))
            return metadata
        }()
        
        
        let node = Node(children: children, metadata: metadata)
        

        header.childCount
        return (node, remainder)
    }
}

let (n,r) = Node.parseNextNode(in: inputNumbers)
n
r

let metadata = n.children.flatMap({ $0.metadata })
metadata
let total = metadata.reduce(0, +)

total

let data = n.children.map({ $0.metadata })
data


let sumTotal = n.weight
let value = n.value


//: [Next](@next)
