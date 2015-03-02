// Playground - noun: a place where people can play

import UIKit

// fizz buzz string
enum FizzBuzz : String {
    case Fizz = "Fizz"
    case Buzz = "Buzz"
    case FizzBuzz = "FizzBuzz"
}

// standard
println("[Standard fizz buzz]")
for i in 1...100 {
    if (i % 3 == 0) && (i % 5 == 0) {
        println(FizzBuzz.FizzBuzz.rawValue)
    } else if ( i % 3 == 0) {
        println(FizzBuzz.Fizz.rawValue)
    } else if ( i % 5 == 0) {
        println(FizzBuzz.Buzz.rawValue)
    } else {
        println(i)
    }
}

// switch and taple
println("[Switch and Taple]")
for i in 1...100 {
    switch (i % 3, i % 5) {
    case (0, 0):
        println(FizzBuzz.FizzBuzz.rawValue)
    case (0, _):
        println(FizzBuzz.Fizz.rawValue)
    case (_, 0):
        println(FizzBuzz.Buzz.rawValue)
    default :
        println(i)
    }
}
