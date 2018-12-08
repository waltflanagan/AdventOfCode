//: [Previous](@previous)

import Foundation



let fakeInput = "dabAcCaCBAcCcaDA"
let input = realInput
//var result = [Character]()

//extension Character {
//    func isUppercase() -> Bool {
//        return self.unicodeScalars.allSatisfy({ CharacterSet.uppercaseLetters.contains($0) })
//    }
//    
//    func isLowercase() -> Bool {
//        return self.unicodeScalars.allSatisfy({ CharacterSet.lowercaseLetters.contains($0) })
//    }
//    
//    func isSameAs(_ other: Character) -> Bool {
//        return toupper(CInt(unicodeScalars.first!.value)) == toupper(CInt(other.unicodeScalars.first!.value))
//    }
//}

var badIndexes = IndexSet()


//
//for (index, char) in input.enumerated() {
//
//    let currentIndex = input.index(input.startIndex, offsetBy: index)
//    guard let previousIndex = input.index(currentIndex, offsetBy: -1, limitedBy: input.startIndex) else {
//        print("ohno")
//        continue
//    }
//
//    let previousChar = input[previousIndex]
//    let reacts = (previousChar.isSameAs(char)) && (char.isUppercase() != previousChar.isUppercase())
//
//    if reacts && !badIndexes.contains(index - 1) {
//        print("\(previousChar) \(char) - bad")
//        badIndexes.insert(index)
//        badIndexes.insert(index - 1)
//    } else {
//        print("\(previousChar) \(char) - good ")
//    }
//
//}


//for index in badIndexes {
//    let sourceIndex = input.index(input.startIndex, offsetBy: index)
//    result.append(input[sourceIndex])
//}




//String(result).count

Polymer.react(realInput)

let pairs = zip("abcdefghigklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVQXYZ")

var results = [String:Int]()

for letterPair in pairs {

    let tempInput = realInput.replacingOccurrences(of: String(letterPair.0), with: "")
    let newInput = tempInput.replacingOccurrences(of: String(letterPair.1), with: "")
    
    results[String(letterPair.0)] = Polymer.react(newInput)
}

print(results)


//: [Next](@next)
