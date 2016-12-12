//: Playground - noun: a place where people can play

import UIKit


let stringPath = NSBundle.mainBundle().pathForResource("LICENSE", ofType: nil)

let string = (try! NSString(contentsOfFile: stringPath!, encoding: NSUTF8StringEncoding) as String)

//let string = "\"aqttwnsohbzian\\\"evtllfxwkog\\\"cunzw\""
//let string = "\"\""

//let components = string?.componentsSeparatedByString("")

let totalCount = string.characters.count

var count = 0


var index = 0
while index < string.characters.count {

    let currentIndex = string.characters.startIndex.advancedBy(index)
    let currentCharacter = string.characters[currentIndex]
    
  
    switch currentCharacter {
        
    case "\"":
        index += 1
        count += 2
        break
    case "\\":
        
        index += 1
        count += 2
        break
    default:
        index += 1
        count += 1
    }
    
}

count - totalCount + 600
//totalCount - count









