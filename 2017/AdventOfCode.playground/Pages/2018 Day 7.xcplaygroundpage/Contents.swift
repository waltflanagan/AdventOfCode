//: [Previous](@previous)

import Foundation



var realInput = """
Step F must be finished before step N can begin.
Step V must be finished before step Y can begin.
Step B must be finished before step W can begin.
Step K must be finished before step O can begin.
Step E must be finished before step H can begin.
Step A must be finished before step P can begin.
Step Y must be finished before step S can begin.
Step T must be finished before step L can begin.
Step G must be finished before step R can begin.
Step I must be finished before step H can begin.
Step X must be finished before step M can begin.
Step N must be finished before step C can begin.
Step O must be finished before step R can begin.
Step Z must be finished before step R can begin.
Step R must be finished before step D can begin.
Step M must be finished before step C can begin.
Step H must be finished before step D can begin.
Step C must be finished before step U can begin.
Step J must be finished before step D can begin.
Step L must be finished before step Q can begin.
Step D must be finished before step U can begin.
Step S must be finished before step U can begin.
Step U must be finished before step Q can begin.
Step P must be finished before step Q can begin.
Step W must be finished before step Q can begin.
Step X must be finished before step R can begin.
Step P must be finished before step W can begin.
Step B must be finished before step U can begin.
Step E must be finished before step J can begin.
Step T must be finished before step R can begin.
Step M must be finished before step L can begin.
Step M must be finished before step P can begin.
Step V must be finished before step T can begin.
Step T must be finished before step U can begin.
Step R must be finished before step W can begin.
Step V must be finished before step A can begin.
Step X must be finished before step S can begin.
Step V must be finished before step U can begin.
Step C must be finished before step P can begin.
Step J must be finished before step S can begin.
Step F must be finished before step D can begin.
Step Y must be finished before step U can begin.
Step L must be finished before step W can begin.
Step F must be finished before step T can begin.
Step B must be finished before step E can begin.
Step F must be finished before step J can begin.
Step R must be finished before step M can begin.
Step Z must be finished before step W can begin.
Step K must be finished before step E can begin.
Step S must be finished before step W can begin.
Step U must be finished before step P can begin.
Step S must be finished before step P can begin.
Step D must be finished before step W can begin.
Step Z must be finished before step P can begin.
Step U must be finished before step W can begin.
Step M must be finished before step J can begin.
Step M must be finished before step W can begin.
Step H must be finished before step U can begin.
Step E must be finished before step C can begin.
Step C must be finished before step Q can begin.
Step L must be finished before step U can begin.
Step Y must be finished before step R can begin.
Step E must be finished before step D can begin.
Step A must be finished before step S can begin.
Step Z must be finished before step J can begin.
Step X must be finished before step W can begin.
Step C must be finished before step D can begin.
Step C must be finished before step S can begin.
Step G must be finished before step N can begin.
Step K must be finished before step Z can begin.
Step T must be finished before step I can begin.
Step H must be finished before step W can begin.
Step E must be finished before step Q can begin.
Step R must be finished before step J can begin.
Step O must be finished before step H can begin.
Step O must be finished before step J can begin.
Step L must be finished before step S can begin.
Step A must be finished before step H can begin.
Step K must be finished before step G can begin.
Step I must be finished before step X can begin.
Step T must be finished before step W can begin.
Step O must be finished before step W can begin.
Step N must be finished before step Q can begin.
Step V must be finished before step Z can begin.
Step H must be finished before step S can begin.
Step F must be finished before step L can begin.
Step X must be finished before step Z can begin.
Step I must be finished before step U can begin.
Step T must be finished before step J can begin.
Step G must be finished before step S can begin.
Step E must be finished before step U can begin.
Step M must be finished before step U can begin.
Step J must be finished before step U can begin.
Step E must be finished before step P can begin.
Step F must be finished before step C can begin.
Step O must be finished before step Q can begin.
Step D must be finished before step Q can begin.
Step A must be finished before step L can begin.
Step H must be finished before step J can begin.
Step I must be finished before step P can begin.
Step Y must be finished before step D can begin.
"""

let fakeInput = """
Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
"""

let test = "Step F must be finished before step E can begin."
test[test.index(test.startIndex, offsetBy: 5)]
test[test.index(test.startIndex, offsetBy: 36)]

var result = [String]()
var currentTime = 0

class LetterOperation: Operation {
    
    let delay: Int
    var ticks = 1
    
    let group = DispatchGroup()
    let identifier: String
    init(_ identifier: String) {
        self.identifier = identifier
        delay = 60 + Int(identifier.unicodeScalars.first!.value - 64)
    }
  
    override func start() {
        
        
        group.enter()
        super.start()
    }
    
    override func main() {
        group.wait()
        
    }
    
    
    func tick() {
     
        if ticks == delay {
            group.leave()
        }
        ticks += 1
    }
}


var operations = [String:LetterOperation]()
var queue = OperationQueue()
queue.maxConcurrentOperationCount = 5
queue.isSuspended = true


let input = realInput
let lines = input.components(separatedBy: .newlines)

for line in lines {
    let dependencyIdentifier = String(line[line.index(line.startIndex, offsetBy: 5)])
    let operationIdentifier = String(line[line.index(line.startIndex, offsetBy: 36)])
    
    let operation = operations[operationIdentifier, default: LetterOperation(operationIdentifier)]
    let dependency = operations[dependencyIdentifier, default: LetterOperation(dependencyIdentifier)]
    
    operation.addDependency(dependency)
    
    operations[dependencyIdentifier] = dependency
    operations[operationIdentifier] = operation
}


for op in operations.values.sorted(by: { $0.identifier < $1.identifier}) {
    queue.addOperation(op)
}


queue.isSuspended = false



while queue.operations.count > 0 {
    
    let running = queue.operations.filter({ $0.isExecuting })
    print("\(running.count)")
    for op in running {
        (op as? LetterOperation)?.tick()
    }
    
    if running.count > 0 {
        currentTime += 1
    }
    usleep(1)
        //    print("\(currentTime) ----- ")}
}

currentTime

//
//result.joined(separator: "")
//result

//: [Next](@next)
