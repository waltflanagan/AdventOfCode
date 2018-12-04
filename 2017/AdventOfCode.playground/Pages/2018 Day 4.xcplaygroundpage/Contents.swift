//: [Previous](@previous)

import Foundation


let input = """
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
"""

let formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"//year-month-day hour:minute
    return formatter
}()

let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"//year-month-day
    return formatter
}()


dayFormatter.string(from: formatter.date(from: "1518-11-05 00:55")!)

struct Guard {
    let number: String
    init(_ numberString: String) {
        number = numberString.replacingOccurrences(of: "Guard #", with: "").replacingOccurrences(of: " begins shift", with: "")
    }
}
extension Guard: Hashable {
    static func == (lhs: Guard, rhs: Guard) -> Bool {
        return lhs.number == rhs.number
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.number)
    }
}

let calendar = Calendar.current
struct Event {
    enum Flavor {
        case sleep
        case wake
        case shiftStart(Guard)
        
        init(_ string: String) {
            switch string {
                
            case "wakes up": self = .wake
            case "falls asleep" : self = .sleep
            default:
                self = .shiftStart(Guard(string))
            }
        }
        
    }
    
    let eventDate: Date
    let minutes: Int
    let type: Flavor
    
    init(_ string: String) {
        let components = string.components(separatedBy: "] ")
        let timeString = components.first!.trimmingCharacters(in: CharacterSet(charactersIn: "["))
        let eventString = components.last!

        type = Flavor(eventString)
        
        let date = formatter.date(from: timeString)!
        eventDate = date
        minutes = calendar.component(.minute, from: date)
    }
}

class Entry {
    let `guard`: Guard
    var currentEvent: Event?
    init(_ guard: Guard) { self.guard = `guard` }
}
    

class Logbook {
    var guards = [Guard]()
    var sleeps = [Guard: NSCountedSet]()
    var totalSleeping = [Guard: Int]()
    var log = [Guard: NSIndexSet]()
    var entries = [String: Entry]()
    
    var currentGuard: Guard?
    var lastEvent: Event?
    var workingSet: NSCountedSet?
    
    func add(_ event: Event) {
    
        let lastMinute = lastEvent?.minutes ?? 0
        
        switch (lastEvent?.type, event.type) {
        case (_,.shiftStart(let newGuard)):
            currentGuard = newGuard
            workingSet = sleeps[newGuard, default: NSCountedSet()]
            sleeps[newGuard] = workingSet
        case (.wake?,.sleep):
            break
        case (.sleep?,.wake):
            for index in lastMinute..<event.minutes {
                workingSet?.add("\(index)")
            }
        default: break
        }
       
        lastEvent = event
    }
    
    var bestSleeper: Guard? {
        let totals = sleeps.mapValues { (sleeps) -> Int in
            let total = sleeps.reduce(0, { (result, object) -> Int in
                return result + sleeps.count(for: object)
            })
            return total
        }
        
        
        let result = totals.reduce(nil) { (winner, entry) -> Guard? in
            guard let current = winner,
                let currentTotal = totals[current]
                else { return entry.key }

            return currentTotal > entry.value ? current : entry.key
        }
        
        return result
    }
}


let events = realInput.components(separatedBy: .newlines).map { Event($0) }
let sortedEvents = events.sorted { (l, r) -> Bool in
    return l.eventDate < r.eventDate
}

let book = Logbook()

for e in sortedEvents {
    book.add(e)
}

guard let sleeper = book.bestSleeper else { exit(0) }

sleeper.number
book.sleeps
let sleeps = book.sleeps[sleeper]

let max = sleeps?.reduce(nil, { (result, minute) -> Any in
    guard let result = result else { return minute }
    let challenger = sleeps!.count(for: minute)
    let current = sleeps!.count(for: result)
    return current > challenger ? result : minute
})
max

var maxMinute: Any?
var maxCount = 0
var maxGuard: Guard?

for entry in book.sleeps {
    let max = entry.value.reduce(nil, { (result, minute) -> Any in
        guard let result = result else { return minute }
        let challenger = entry.value.count(for: minute)
        let current = entry.value.count(for: result)
        return current > challenger ? result : minute
    })
    
    let amount = entry.value.count(for: max ?? "-1")
    if amount > maxCount {
        maxCount = amount
        maxMinute = max
        maxGuard = entry.key
    }
}

maxGuard?.number
maxMinute


//: [Next](@next)
