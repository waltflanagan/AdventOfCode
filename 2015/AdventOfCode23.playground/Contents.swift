//: Playground - noun: a place where people can play

import UIKit

class Register {
    var value: UInt = 0
    
    init(value: UInt = 0) {
        self.value = value
    }
    
    func increment() {
        value += 1
    }
    
    func half() {
        value /= 2
    }
    
    func triple() {
        value *= 3
    }
    
    func isEven() -> Bool {
        return value % 2 == 0
    }
}

extension Register: CustomDebugStringConvertible {
    var debugDescription: String {
        return "\(value)"
    }
}

extension Register: CustomStringConvertible {
    var description: String {
        return "\(value)"
    }
}




class Computer {
    
    private(set) var a = Register(value: 1)
    private(set) var b = Register()
    
    var position: Int = 0
    
    let instructions:[String]
    
    init(instructions: [String]) {
        self.instructions = instructions
    }
   
    func run() {
        while position < instructions.count {
            tick()
        }
    }
    
    func tick() {
        
        let instructionString = instructions[position]
        

        let components = instructionString.componentsSeparatedByString(" ")
        
        let instruction = components[0]
        let arguments = Array(components[1..<components.count])
       
        
        switch instruction {
        case "inc" : registerForArugments(arguments).increment()
        case "hlf" : registerForArugments(arguments).half()
        case "tpl" : registerForArugments(arguments).triple()
        case "jmp" :
            if let offset = Int(arguments[0]) {
                position += (offset - 1)
            }
        case "jio":
            
            let register = registerForArugments(arguments)
            
            if let offset = Int(arguments[1]) where register.value == 1 {
                position += (offset - 1)
            }
            
        case "jie":
            let register = registerForArugments(arguments)
            
            if let offset = Int(arguments[1]) where register.isEven()  {
                position += (offset - 1)
            }
            
        default: break
        }
        
        position += 1
    }
    
    func registerForIdentifer(identifier:Character) -> Register {
        let register: Register
        
        switch identifier {
        case "a":
            register = self.a
        case "b":
            register = self.b
        default:
            preconditionFailure()
        }
        
        return register
    }
    
    func registerForArugments(arguments: [String] ) -> Register {
        let registerIdentifer = arguments[0].characters.first!
        
        let register = registerForIdentifer(registerIdentifer)
        
        return register
    }
    
}

extension Computer: CustomStringConvertible {
    var description: String {
        return "a - \(a), b - \(b), p - \(position)"
    }
}

let input = ["jio a, +16", "inc a", "inc a", "tpl a", "tpl a", "tpl a", "inc a", "inc a", "tpl a", "inc a", "inc a", "tpl a", "tpl a", "tpl a", "inc a", "jmp +23", "tpl a", "inc a", "inc a", "tpl a", "inc a", "inc a", "tpl a", "tpl a", "inc a", "inc a", "tpl a", "inc a", "tpl a", "inc a", "tpl a", "inc a", "inc a", "tpl a", "inc a", "tpl a", "tpl a", "inc a", "jio a, +8", "inc b", "jie a, +4", "tpl a", "inc a", "jmp +2", "hlf a", "jmp -7"]

let input2 = ["inc a",
    "jio a, +2",
    "tpl a",
    "inc a"]

let c = Computer(instructions: input)

c.run()

c.a
print("\(c)")

