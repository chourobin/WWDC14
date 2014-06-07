// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Basics
for character in "mouse" {
    println("\(character)")
}

var names : String[] = ["hello", "world"]

// Range 1 to 5 inclusive
for number in 1...5 {
    println("\(number)")
}

// Range 1 to 4 (excludes last one)
for number in 0..5 {
    println("\(number)")
}

let numberOfLegs = ["ant": 6, "snake": 0]
for (name, legCount) in numberOfLegs {
    println("\(name) has \(legCount) legs")
}

