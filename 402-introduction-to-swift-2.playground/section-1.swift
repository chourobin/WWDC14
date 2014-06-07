// Playground - noun: a place where people can play

import Cocoa
import UIKit

var str = "Hello, playground"

/*
Basics
*/

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

let numberOfLegs = ["ant": 6, "snake": 0, "human": 2]
for (name, legCount) in numberOfLegs {
    println("\(name) has \(legCount) legs")
}

/*
Beyond the Basics
*/

// Optionals
let possibleLegCount : Int? = numberOfLegs["asdsad"]
// possibleLegCount is an optional integer

if possibleLegCount == nil {
    println("leg count not found")
} else {
    // we have to unwrap optional integer to a constant
    let legCount = possibleLegCount!
    // The ! triggers an assertion if you assing legCount = nil
    println("has \(legCount) legs")
}

// A shorter way to write this
// The entire block is skipped if legCount/possibleLegCount == nil
if let legCount = possibleLegCount {
    println("has \(legCount) legs")
}

let legCount = 2
switch legCount {
case 0:
    println("0")
case 1, 2:
    println("1 or 2")
case 3...8:
    println("1 to 8")
default:
    println("default")
}

// Return multiple values using tuples
func refreshWebPage() -> (Int, String) {
    return (200, "Success")
}

let (statusCode, message) = refreshWebPage()
println("Received \(statusCode): \(message)")

// Named values
func refreshWebPageNamed() -> (code: Int, message: String) {
    return (200, "Success")
}

// Assign to a single type constant
let status = refreshWebPageNamed()

// Access values easily by it's name
println("Received \(status.code): \(status.message)")

// Closures
let greetingPrinter = {
    println("Hello World")
}

// Same as writing this:
let greetingPrinter2 : () -> () = {
    println("Hello World")
}

// Closures as variables
func repeat(count: Int, task: () -> ()) {
    for i in 0..count {
        task()
    }
}

repeat(2, {
    println("hello")
    })

// A shorter way to write this
repeat(2) {
    println("trailing closures can get rid of the parentheses")
}

/*
Data Types
*/

// Classes
class Vehicle {
    // instance variables and properties are one and the same
    var numberOfWheels = 0
    
    // computed properties - generated return
    var description : String {
    return "\(numberOfWheels) wheels"
        //    get {
        //        return "\(numberOfWheels) wheels"
        //    }
        //    set {
        //
        //    }
    }
}

// Subclass
class Bicycle : Vehicle {
    // bicycles have 2 by default
    // use an initializer to override default properties
    init() {
        super.init()
        numberOfWheels = 2
    }
}

let someVehicle = Vehicle()
var description = someVehicle.description

someVehicle.numberOfWheels = 2
description = someVehicle.description

let myBicycle = Bicycle()

// Override properties
class Car : Vehicle {
    var speed = 0.0
    init() {
        super.init()
        numberOfWheels = 4
    }
    override var description : String {
    return super.description + ", \(speed) mph"
    }
}

let myCar = Car()
myCar.speed = 25

// Property observers
class ParentsCar : Car {
    override var speed : Double {
    willSet {
        // newValue is available here
        if newValue > 65.0 {
            println("Careful now")
        }
    }
    didSet {
        // oldValue is available here
    }
    }
}

// Methods
class Counter {
    var count = 0
    
    func increment() {
        count++
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func resetToCount(count: Int) {
        self.count = count
    }
}

/*
Beyond Classes
*/

struct Point {
    var x, y : Double
}

struct Size {
    var width, height : Double
}

struct Rect {
    var origin : Point
    var size : Size
    
    var area : Double {
    return size.width * size.height
    }
    
    func isBiggerThanRect(other: Rect) -> Bool {
        return self.area > other.area
    }
}

let rect = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 100, height: 100))

// What is the difference between a struct and a class?
class Window {
    var title = ""
    var frame : Rect = rect
}

// 1. Structs cannot inherit from other structs
// 2. How values are passed around

var window = Window()

// structs are passed by value
// classes are passed by reference instead of making a copy like a struct

var newFrame = window.frame

newFrame.origin.x = 20.0
// if it were a class, it would modify the reference instance (obj - object) and modify the window

let window2 = Window()
window2.title = "Hello"

// window2 = Window()
// not allowed

// Enums
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Jupiter
}

enum CompassPoint {
    case North, South, East, West
}

var directionToHead = CompassPoint.West
directionToHead = .East

let label = UILabel()
label.textAlignment = .Right

// Enumerations : Association Values
enum TrainStatus {
    case OnTime
    case Delayed(Int)
    
    init() {
        self = OnTime
    }
    
    var description : String {
        switch self {
            case OnTime:
                return "on time"
            case Delayed(let minutes):
                return "delayed by \(minutes) minute(s)"
        }
    }
}

var status = TrainStatus()
// status is inferred

status = .Delayed(42)
println("\(status.description)")

// Nested types
class Train {
    enum Status {
        case OnTime, Delayed(Int)
        init() {
            self = OnTime
        }
        var description : String {
        switch self {
        case OnTime:
            return "on time"
        case Delayed(let minutes):
            return "delayed by \(minutes) minute(s)"
            }
        }
    }
    
    var status = Status()
}

// Extensions
// Works on named types
extension CGSize {
    mutating func increaseByFactor(factor: Int) {
        width *= factor
        height *= factor
    }
}

extension Int {
    func repetitions(task: () -> ()) {
        for i in 0..self {
            task()
        }
    }
}

500.repetitions({
    println("Hello!")
})

// trailing closures
500.repetitions {
    println("Hello!")
}

// Generics

// Non-generic structure
struct IntStack {
    var elements = Int[]()
    
    mutating func push(element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int {
        return elements.removeLast()
    }
}

// Generic structure
struct Stack<T> {
    var elements = T[]()
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T {
        return elements.removeLast()
    }
}

var intStack = Stack<Int>()
intStack.push(50)
let lastIn = intStack.pop()

var stringStack = Stack<String>()
stringStack.push("Hello")
println(stringStack.pop())


