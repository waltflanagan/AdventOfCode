//: [Previous](@previous)

import Foundation

func findUnbalancedChild(_ root: Plate) {
    
    let unbalancedChild = root.children.filter( {!$0.balanced }).first
    
    if let unbalancedChild = unbalancedChild {
        findUnbalancedChild(unbalancedChild)
    } else {
        var weights = [Int: [Plate]]()
        
        root.children.forEach { weights[$0.realWeight, default: []].append($0) }
        
        if let oddPlateOut = weights.filter({ $0.value.count == 1 }).first?.value.first {
            print("\(oddPlateOut.weight)")
        }
    }
}

let start = Date()
let root = plateTreeFrom(platesString)
findUnbalancedChild(root)
print("\(Date().timeIntervalSince(start))")


//: [Next](@next)
