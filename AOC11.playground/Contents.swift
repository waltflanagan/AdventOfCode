//: Playground - noun: a place where people can play

import UIKit




func incrementString(string:String) -> String{
    
    if let lastCharacter = string.characters.last {
        let firstPart = string.substringToIndex(string.endIndex.advancedBy(-1))

        if lastCharacter == "z".characters.last! {
            return incrementString(firstPart) + "a"
        } else {
            let characterValue = String(lastCharacter).unicodeScalars.first!.value
            let newCharacter = String(Character(UnicodeScalar(characterValue + 1)))
            return firstPart + newCharacter
        }
    
    }
    return "foo"
}



func validPassword(password:String) -> Bool {

    let characters = password.characters
    
    var hasDoubleDouble = false
    var firstRange: NSRange?
    
    var hasRun = false
    
    for (index,letter) in characters.enumerate() {
        
        guard letter != "i" else { return false }
        guard letter != "o" else { return false }
        guard letter != "l" else { return false }
        
        guard index+1 < characters.count else { break }
        
        let nextCharacter = characters[characters.startIndex.advancedBy(index+1)]
        
        if hasDoubleDouble == false && nextCharacter == letter {
            let doubleRange = NSMakeRange(index, 2)
            
            if let firstRange = firstRange where NSIntersectionRange(firstRange, doubleRange).length == 0 {
                hasDoubleDouble = true
            } else {
                firstRange = doubleRange
            }
        }
    
        
        hasRun = {
            
            guard index+2 < characters.count else { return false }

            let next = characters[characters.startIndex.advancedBy(index+1)]
            let nextNext = characters[characters.startIndex.advancedBy(index+2)]
      
            let nextValue = next.value
            let letterValue = letter.value
            let difference = Int(nextValue) - Int(letterValue)
            
            if ( difference == 1 ) && ( nextNext.value - nextCharacter.value == 1 )  {
                return true
            }
            
            return false
        }()
        
        
        
    }
    
    return hasDoubleDouble && hasRun
}

extension Character {
    var value: Int {
        return Int(String(self).unicodeScalars.first!.value)
    }
}

var newPassword = incrementString("hxbxwxba")

var foo = validPassword(newPassword)

while !validPassword(newPassword) {
    newPassword
    newPassword = incrementString(newPassword)
}








