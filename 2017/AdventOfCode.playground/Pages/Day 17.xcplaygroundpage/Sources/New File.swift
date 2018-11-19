import Foundation


public func go2() {
    let steps = 355
    
    var currentPosition = 0
    
    for i in 1...50000000 {
        
        currentPosition = (currentPosition + steps) % (i)
        
        let insert = currentPosition + 1
        
        currentPosition = insert
        
        if insert == 1 {
            print(i)
        }
        
    }
}
