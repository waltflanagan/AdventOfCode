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

func hasDouble(string:String) -> Bool {
    let characters = string.characters
    var hasDoubleDouble = false
    var firstRange: NSRange? = nil
    
    for (index,letter) in characters.enumerate() {
    
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
    }
    
    return hasDoubleDouble
}

func hasRun(string:String) -> Bool {
    let characters = string.characters
    
    for (index,letter) in characters.enumerate() {
        
        guard index+2 < characters.count else { return false }
        
        let next = characters[characters.startIndex.advancedBy(index+1)]
        let nextNext = characters[characters.startIndex.advancedBy(index+2)]
        
        let nextValue = next.value
        let letterValue = letter.value
        let difference = Int(nextValue) - Int(letterValue)
        
        if ( difference == 1 ) && ( nextNext.value - next.value == 1 )  {
            return true
        }
    }
    return false
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
            
            if ( difference == 1 ) && ( nextNext.value - next.value == 1 )  {
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

"hxbaabcc"
var otherPassword = "hxbxyaaa"
var newPassword = "hxbxxyzz"

hasDouble(newPassword)
hasRun(newPassword)

func valid2(password:String) -> Bool {
    for (index,letter) in password.characters.enumerate() {
        guard letter != "i" else { return false }
        guard letter != "o" else { return false }
        guard letter != "l" else { return false }
    }
    
    return hasDouble(password) && hasRun(password)
}

var foo = valid2(newPassword)

foo

var shouldBreak = false
//
while !shouldBreak {
//    newPassword
    
    
    newPassword = incrementString(newPassword)
    
    
    shouldBreak = valid2(newPassword)
}

newPassword
//
//
//









