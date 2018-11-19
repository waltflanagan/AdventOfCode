import Foundation



public protocol ValueSender {
    var value: Int { get }
}

public protocol ValueReceiver {
    func set(_ value: Int)
}

public protocol RegisterType: ValueSender, ValueReceiver {
}

extension Int: ValueSender {
    public var value: Int {
        return self
    }
}



class Store {
    var _storage = [String: Int]()
    
    subscript(_ string: String) -> Int {
        get { return _storage[string, default: 0] }
        set { _storage[string] = newValue }
    }
}

struct Register: RegisterType {
    let name: String
    let storage: Store
    
    var value: Int {
        get {
            return storage[name]
        }
        
        set {
            set(newValue)
        }
    }
    
    func set(_ value: Int) {
        storage[name] = value
    }
}

class MessageQueue: RegisterType {
    
    var storage = [Int]()
    
    var hasValue: Bool {
        return storage.count > 0
    }
    
    var value: Int {
        get { return storage.popLast()! }
        set { set(newValue) }
    }
    
    func set(_ value: Int) {
        storage.insert(value, at: 0)
    }
}

public class Pipe: RegisterType {
    public let incoming: RegisterType
    public let outgoing: RegisterType
    
    public var sendCount = 0
    
    public init() {
        self.incoming = MessageQueue()
        self.outgoing = MessageQueue()
    }
    
    init(incoming: RegisterType, outgoing: RegisterType ) {
        self.incoming = incoming
        self.outgoing = outgoing
    }
    
    public var value: Int {
        get {
            return outgoing.value
        }
        
        set {
            set(newValue)
        }
    }
    
    public func set(_ value: Int) {
        sendCount += 1
        incoming.set(value)
    }
}

public class DuetChannel {
    public let pipe1: Pipe
    public let pipe2: Pipe
    
    public init() {
        let firstPipe = Pipe()
        pipe1 = firstPipe
        pipe2 = Pipe(incoming:firstPipe.outgoing, outgoing: firstPipe.incoming)
    }
}



enum Instruction {
    case set(Register, ValueSender)
    case add(Register, ValueSender)
    case mul(Register, ValueSender)
    case mod(Register, ValueSender)
    case snd(ValueReceiver, ValueSender)
    case rcv(ValueSender, ValueReceiver)
    case jgz(ValueSender, ValueSender)
    
    init(string: String, storage: Store, remote: RegisterType) {
        let components = string.components(separatedBy: " ")
        
        let y: ValueSender? = {
            guard components.count == 3 else { return nil }
            
            let y = components[2]
            
            if let integer = Int(y) {
                return integer
            } else {
                return Register(name: y, storage: storage)
            }
        }()
        
        let x: ValueSender = {
            if let integer = Int(components[1]) {
                return integer
            } else {
                return Register(name: components[1], storage: storage)
            }
        }()
        
        
        switch components[0] {
        case "set":
            self = .set(x as! Register, y!)
        case "add":
            self = .add(x as! Register, y!)
        case "mul":
            self = .mul(x as! Register, y!)
        case "mod":
            self = .mod(x as! Register, y!)
        case "snd":
            self = .snd(remote, x)
        case "rcv":
            self = .rcv(remote, x as! ValueReceiver)
        case "jgz":
            self = .jgz(x, y!)
        default:
            fatalError()
        }
    }
    
    
    func execute() -> Int {
        
        var jumpValue = 1
        switch self {
        case .set(var x, let y):
            x.value = y.value
        case .add(var x, let y):
            x.value = x.value + y.value
        case .mul(var x, let y):
            x.value = x.value * y.value
        case .mod(var x, let y):
            x.value = x.value % y.value
        case .snd(let remote, let x):
            //            print("send - \(x.value)")
            remote.set(x.value)
        case .rcv(let remote, let x):
            //            print("rcv")
            guard let remote = remote as? Pipe, (remote.outgoing as? MessageQueue)?.hasValue == true else {
                jumpValue = 0
                break
            }
            
            x.set(remote.value)
        case .jgz(let x, let y):
            guard x.value > 0 else { return 1}
            jumpValue = y.value
            break
        }
        
        return jumpValue
    }
    
}

public let input = """
set i 31
set a 1
mul p 17
jgz p p
mul a 2
add i -1
jgz i -2
add a -1
set i 127
set p 680
mul p 8505
mod p a
mul p 129749
add p 12345
mod p a
set b p
mod b 10000
snd b
add i -1
jgz i -9
jgz a 3
rcv b
jgz b -1
set f 0
set i 126
rcv a
rcv b
set p a
mul p -1
add p b
jgz p 4
snd a
set a b
jgz 1 3
snd b
set f 1
add i -1
jgz i -11
snd a
jgz f -16
jgz a -19
"""


public class Program {
    
    var sound: Int = 0
    var currentStackPointer = 0
    //    var stop = false
    
    let instructionString: String
    let pipe: Pipe
    
    lazy var instructions: [Instruction] = {
        return instructionString.components(separatedBy: "\n").map {  Instruction(string: $0, storage: memory, remote: pipe) }
    }()
    
    var memory = Store()
    
    public init(_ string: String, id: Int, pipe: Pipe) {
        self.pipe = pipe
        instructionString = string
        memory["p"] = id
    }
    
    func execute() {
        while (0..<(instructions.count)).contains(currentStackPointer) {
            print("\(currentStackPointer)")
            currentStackPointer += instructions[currentStackPointer].execute()
        }
    }
    
    public func tick() -> Bool {
        if  (0..<(instructions.count)).contains(currentStackPointer) {
            currentStackPointer += instructions[currentStackPointer].execute()
            return true
        } else {
            return false
        }
    }
}
