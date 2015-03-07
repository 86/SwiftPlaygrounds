// Playground - noun: a place where people can play

import UIKit


let names = ["Chris", "Alex ", "Ewa", "Barray","Deniella"]

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversed: [String]

// Reverse sort ( E -> D -> C -> B -> A )
reversed = sorted(names, backwards)

// Sort with closure
reversed = sorted(names, {(s1: String, s2: String) -> Bool in
    return s1 > s2
})

/* Closure syntax
{(<#parameters#>) -> <#return type#> in
  <#statements#>
}
*/

// Inferring Type From Context
reversed = sorted(names, {s1, s2 in return s1 > s2})
reversed

// Implicit Returns from Single-Expression Closures
reversed = sorted(names, {s1, s2 in s1 > s2})
reversed

// Shorthand Argument Names
reversed = sorted(names, {$0 > $1})
reversed

// Trailling Closures
reversed = sorted(names) {$0 > $1}
reversed

// Trailling Closures Effective Sample
let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]
let strings = numbers.map {(var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        println(number % 10)
        number /= 10
    }
    return output
}
strings

// Capturing Values (return type is func "() -> Int")
func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementor
}

let plusPlus = makeIncrementor(forIncrement: 1)
for i in 1...10 {
    plusPlus()
}

let incrementByTen = makeIncrementor(forIncrement: 10)
for i in 1...9 {
    incrementByTen()
}

// Closures are reference types
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

