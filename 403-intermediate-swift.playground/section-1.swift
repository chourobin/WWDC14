// Playground - noun: a place where people can play

import UIKit

/*
Optionals
*/

// > Enter your age:
// > how rude!

// Traditionally you have NULL, NSNotFound, Nil, nil, 0, -1, INT_MAX
// let age = response.toInt()

var optionalNumber: Int?
// default initialized to nil

optionalNumber = 6

// Optional return types
func findIndexOfString(string: String, array: String[]) -> Int? {
    for (index, value) in enumerate(array) {
        if value == string {
            return index
        }
    }
    return nil
}

var neighbors = ["Alex", "Anna", "Madison", "David"]

if let index = findIndexOfString("Madison", neighbors) {
    println("Hello, \(neighbors[index])")
} else {
    println("Not present")
}

// Optional binding
class Person {
    var residence: Residence?
}

class Residence {
    var address: Address?
}

class Address {
    var buildingNumber: String?
    var streetName: String?
    var apartmentNumber: String?
}

let paul = Person()

var addressNumber: Int?
if let home = paul.residence {
    if let postalAddress = home.address {
        if let building = postalAddress.buildingNumber {
            if let convertedNumber = building.toInt() {
                addressNumber = convertedNumber
            }
        }
    }
}

// A shorter way to write this
// This is called optional chaining
addressNumber = paul.residence?.address?.buildingNumber?.toInt()

if let addressNum = paul.residence?.address?.buildingNumber?.toInt() {
    println("\(addressNum)")
}

// Optional: Under the hood
enum Optional<T> {
    case None
    case Some(T)
}

/*
Memory Management
*/

// Swift uses ARC

class BowlingPin {}
func juggle(count: Int) {
    var left = BowlingPin()
    if count > 1 {
        var right = BowlingPin()
        right = left
    }
}

// Ownership
// Using weak references
class Apartment {
    weak var tenant: Tenant?
}

class Tenant {
    weak var home: Apartment?
    
    func moveIn(apt: Apartment) {
        self.home = apt
        apt.tenant = self
    }
}

var renters = ["Robin": Tenant()]
var apts = [507: Apartment()]

renters["Robin"]!.moveIn(apts[507]!)


// Weak references aren't guaranteed even after testing
var apt = apts[507]
//if apt.tenant {
//    apt.tenant!.cashRentCheck() // Runtime Error
//    apt.tenant!.greet() // Runtime Error
//}

// So they are not always the best
class P {
    var card: CreditCard?
}

class CreditCard {
    unowned let holder: P
    
    init(holder: P) {
        self.holder = holder
    }
}

// Strong, Weak, Unowned references
// Use strong references from owners to the objects they own
// Use weak references among objects with independent lifetimes
// Use unowned references from owned objects with the same lifetime

/* 
Initialization
*/

// Every value must be initialized before it is used

var message: String




