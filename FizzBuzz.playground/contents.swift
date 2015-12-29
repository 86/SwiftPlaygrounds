// Playground - noun: a place where people can play

import UIKit

// fizz buzz string
enum FizzBuzz: String {
    case Fizz
    case Buzz
    case FizzBuzz
}

// standard
print("===================================================")
print("[Standard fizz buzz]")
print("===================================================")
for i in 1...100 {
    if (i % 3 == 0) && (i % 5 == 0) {
        print(FizzBuzz.FizzBuzz.rawValue)
    } else if ( i % 3 == 0) {
        print(FizzBuzz.Fizz.rawValue)
    } else if ( i % 5 == 0) {
        print(FizzBuzz.Buzz.rawValue)
    } else {
        print(i)
    }
}

// switch and taple
print("===================================================")
print("[Switch and Taple]")
print("===================================================")
for i in 1...100 {
    switch (i % 3, i % 5) {
    case (0, 0): print(FizzBuzz.FizzBuzz.rawValue)
    case (0, _): print(FizzBuzz.Fizz.rawValue)
    case (_, 0): print(FizzBuzz.Buzz.rawValue)
    case (_, _): print(i)
    }
}

// foreach
print("===================================================")
print("[foreach]")
print("===================================================")
(1...100).forEach {
    switch ($0 % 3, $0 % 5) {
    case (0, 0): print(FizzBuzz.FizzBuzz.rawValue)
    case (0, _): print(FizzBuzz.Fizz.rawValue)
    case (_, 0): print(FizzBuzz.Buzz.rawValue)
    case (_, _): print($0)                    
    }
}
