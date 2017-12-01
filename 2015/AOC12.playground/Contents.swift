//: Playground - noun: a place where people can play

import UIKit

let stringPath = NSBundle.mainBundle().pathForResource("JSON", ofType: nil)

let string = try! NSString(contentsOfFile: stringPath!, encoding: NSUTF8StringEncoding)

let json: NSArray = try! NSJSONSerialization.JSONObjectWithData(string.dataUsingEncoding(NSUTF8StringEncoding)!, options: NSJSONReadingOptions.AllowFragments) as! NSArray

var count = 0

func parseArray(array: NSArray) -> Int {
    
    var arrayCount = 0
    
    for object in array {
        switch object {
        case let dictionary as NSDictionary:
            arrayCount += parseJsonObject(dictionary)
        case let array as NSArray:
            arrayCount += parseArray(array)
        case let int as Int:
            arrayCount += int
        default: break
        }
    }
    
    return arrayCount
}

func parseJsonObject(object:NSDictionary) -> Int {
    
    var foo:NSMutableArray? = NSMutableArray()
    
    object.enumerateKeysAndObjectsUsingBlock { (key, object, _) -> Void in
        if let object = object as? String where object == "red" {
            foo = nil
        }
        foo?.addObject(object)
    }
    
    return (foo != nil) ? parseArray(foo!) : 0
}


for object in json {
    
    switch object {
    case let dictionary as NSDictionary:
        count += parseJsonObject(dictionary)
    case let array as NSArray:
        count += parseArray(array)
    default:
        print("i got nothing")
    }
    
}

count









