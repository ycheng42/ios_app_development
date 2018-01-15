//Swift Optionals Tutorial - Unwrapping - Guard, If Let, Chaning, Force

import UIKit

var optionalNumber: Int?
//optionalNumber = 23

// IF LET

if let number = optionalNumber {
    print("I have a value, it is \(number)")
} else {
    print("I do not have a value, I am nil")
}

// GUARD

func tripleNumber(number: Int?) {
    guard let number = number else {
        print("Exiting Function")
        return
    }
    
    print("My tripled number is \(number * 3)")
}

tripleNumber(number: optionalNumber)

// FORCE UNWRAPPING
//let forceNumber = optionalNumber!

//OPTIONAL CHAINING
struct Device {
    var type: String
    var price: Float
    var color: String
}
var myPhone: Device?
myPhone = Device(type: "Phone", price: 699.0, color: "Pink")

let devicePrice = myPhone?.price

if let devicePrice = devicePrice {
    print("My total Price = \(devicePrice + 8.99)")
}
