//: Playground - noun: a place where people can play

import UIKit


let input = ["Faerun to Norrath = 129",
    "Faerun to Tristram = 58",
    "Faerun to AlphaCentauri = 13",
    "Faerun to Arbre = 24",
    "Faerun to Snowdin = 60",
    "Faerun to Tambi = 71",
    "Faerun to Straylight = 67",
    "Norrath to Tristram = 142",
    "Norrath to AlphaCentauri = 15",
    "Norrath to Arbre = 135",
    "Norrath to Snowdin = 75",
    "Norrath to Tambi = 82",
    "Norrath to Straylight = 54",
    "Tristram to AlphaCentauri = 118",
    "Tristram to Arbre = 122",
    "Tristram to Snowdin = 103",
    "Tristram to Tambi = 49",
    "Tristram to Straylight = 97",
    "AlphaCentauri to Arbre = 116",
    "AlphaCentauri to Snowdin = 12",
    "AlphaCentauri to Tambi = 18",
    "AlphaCentauri to Straylight = 91",
    "Arbre to Snowdin = 129",
    "Arbre to Tambi = 53",
    "Arbre to Straylight = 40",
    "Snowdin to Tambi = 15",
    "Snowdin to Straylight = 99",
    "Tambi to Straylight = 70"]


class City {
    
    let name: String
    var connections = [City:Int] ()
    init(name:String) {
        self.name = name
    }
    
    func distanceTo(city: City) -> Int {
        return connections[city]!
    }
    
    func addConnection(city: City, weight: Int) {
        connections[city] = weight
    }
}

extension City: Hashable {
    var hashValue: Int {
        return name.hashValue
    }
}

extension City: Equatable { }

func ==(lhs: City, rhs: City) -> Bool {
    return lhs.name == rhs.name
}


struct Path {
    var cities = [City]()
    var weight = 0
    
    mutating func visitCity(city: City) {
        if cities.count > 0 {
            weight += cities.last!.distanceTo(city)
        }
        
        cities.append(city)
    }
}

class Map {
    var paths = [Path]()

    var cities = [String:City]()
    
    init(strings: [String]) {
        for entry in strings {
            
            let components = entry.componentsSeparatedByString(" ")
            
            let city1 = cityNamed(components[0])
            let city2 = cityNamed(components[2])
            let value = Int(components[4])!
            
            city1.addConnection(city2, weight: value)
            city2.addConnection(city1, weight: value)
        }
    }
    
    func cityNamed(name:String) -> City {
        if let city = cities[name] {
            return city
        } else {
            let city = City(name: name)
            cities[name] = city
            return city
        }
    }
    
    func run() {
        var paths = [Path]()
        
        for city in cities {
            let path = Path()
            
            path.visitCity(city)
            
        }
    }
    
    
    
}







