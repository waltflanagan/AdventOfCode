//: [Previous](@previous)

import Foundation

let input = """
0: 3
1: 2
2: 4
4: 4
6: 5
8: 6
10: 6
12: 8
14: 6
16: 6
18: 8
20: 12
22: 8
24: 8
26: 9
28: 8
30: 8
32: 12
34: 20
36: 10
38: 12
40: 12
42: 10
44: 12
46: 12
48: 12
50: 12
52: 12
54: 14
56: 14
58: 12
62: 14
64: 14
66: 14
68: 14
70: 14
72: 14
74: 14
76: 14
78: 14
80: 18
82: 17
84: 14
"""

let testInput = """
0: 3
1: 2
4: 4
6: 4
"""




//let firewall = Firewall(input)
//firewall.size
//
//for _ in 0...firewall.size {
//    firewall.tick()
//}
//
//firewall.severity

for delay in 1..<10000 {
    
    let testFirewall = Firewall(input)
    for _ in 1..<delay {
        testFirewall.spin()
    }
    
    for _ in 0...testFirewall.size {
        testFirewall.tick()
    }
    
    if testFirewall.severity == 0 {
        print("\(delay)")
        break
    }
}





//: [Next](@next)
