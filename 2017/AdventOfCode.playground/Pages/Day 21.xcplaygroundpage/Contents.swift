//: [Previous](@previous)

import Foundation


extension Image {
    
    func enhance() -> Image {
        
        for pair in enhancements {
            guard pair.count == 2 else {
                continue
            }

            
            if pair[0] == self {
//                print("self - \(debugDescription)")
//                print("\(pair[0].slashDescription) -> \(pair[1].slashDescription)")
               return pair[1]
            }
        }

        fatalError()
        return enhancements.first![0]
    }
    
}



let base = Image("""
.#.
..#
###
""")


//print("------------\(Image(base.enhance().split().map({ $0.map{ $0.enhance() } })).debugDescription)")
print("------------\(Image(base.enhance().split()).slashDescription)")
print("------------\(base.enhance().slashDescription)")




enhancements.filter({
    $0[0] == base
    }).count

print(base.enhance().debugDescription)



let test2 =  Image(slashedImage: "##./#.#/#..")

test2 == base


let base2 = Image(slashedImage: ".#./..#/###")
print(base2.debugDescription)


//
//let test = Image("""
//.......##.##
//.#..###.##.#
//##.#.##..#..
//.####.....##
//#.##...###.#
//#..#..#.##..
//##...#.##.##
//##..#.#.##.#
//.##.###..#..
//..#.......##
//.#..##.###.#
//.###.##.##..
//""")
//
//print("------------------------------------\(Image(test.split()).debugDescription)")
//
//print("-------\(String(describing: test.split().first?.debugDescription))")


//
let start = Date()
var workingImage = base
for _ in 0..<5 {

    let images = workingImage.split()

    let enhancedImages = images.map({ $0.map{ $0.enhance() } })

    workingImage = Image(enhancedImages)
}


workingImage.brightness
print("\(Date().timeIntervalSince(start))")
print(workingImage.debugDescription)
////: [Next](
//.#.#/..#./.##./.#.#

//@next)

