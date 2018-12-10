import Foundation

public class Marble {
    
    let value: Int
    var clockwise: Marble?
    var counterClockwise: Marble?
    
    init(_ value: Int) {
        self.value = value
    }
    
    func insert(_ marble: Marble) {
        marble.clockwise = clockwise
        marble.counterClockwise = self
        
        clockwise?.counterClockwise = marble
        clockwise = marble
    }
    
    func remove() -> Int {
        
        clockwise?.counterClockwise = counterClockwise
        counterClockwise?.clockwise = clockwise
        
        return value
    }
    
    func marble(at index: Int) -> Marble {
        if index < 0 {
            return counterClockwise!.marble(at: index + 1 )
        } else if index > 0 {
            return clockwise!.marble(at: index - 1 )
        } else {
            return self
        }
    }
}



public class Game {
    let players: Int
    let maxMarble: Int
    var scores = [Int: Int]()
    var current: Marble
    var turnNumber = 1
    
    public init(players: Int, maxMarble: Int) {
        self.players = players
        self.maxMarble = maxMarble
        
        let start = Marble(0)
        start.insert(start)
        
        current = start
    }
    
    public func play() -> Int {
        for marbleValue in 1...maxMarble {
            
            if marbleValue % 23 == 0 {
                
                let removed = current.marble(at: -7)
                current = removed.clockwise!
                
                let removedValue = removed.remove()
                
                let player = marbleValue % players
                scores[player] = scores[player, default:0] + marbleValue + removedValue
            } else {
                
                let newMarble = Marble(marbleValue)
                
                let nextMarble = current.marble(at: 1)
                nextMarble.insert(newMarble)
                
                current = newMarble
            }
            
        }
        
        return winningScore
    }
    
    var winningScore: Int {
        return scores.values.reduce(0, max)
    }
}
