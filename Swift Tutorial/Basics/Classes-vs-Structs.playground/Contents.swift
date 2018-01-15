//: Playground - noun: a place where people can play

// Classes are reference types
// What it means when you're passing a reference type, it is like I gave
// somebody access to my Google spreadsheet and they changed all the numbers
// on it amd now it is affecting my original spreadsheet.

import UIKit

class MacBook {
    
    var year: Int
    var color: String
    
    init(year: Int, color: String) {
        self.year = year
        self.color = color
    }
}

let myMacBook = MacBook(year: 2016, color: "Space Grey")
var stolenMacBook = myMacBook

stolenMacBook.color = "Spraypainted Green"
print(myMacBook.color)

// Structs are value types
// This is like I emailed my friend a COPY of my iPhone
// and he can do whatever he wants to do because it is a
// COPY

struct iPhone {
    var number: Int
    var color: String
}

let myiPhone = iPhone(number: 7, color: "Balck")
var stoleniPhone = myiPhone

stoleniPhone.color = "Rose Gold"

print(myiPhone)



