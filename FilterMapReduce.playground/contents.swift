// Playground - noun: a place where people can play

import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// filter
let even = array.filter{$0 % 2 == 0}
even

// map
let squre = array.map{$0 * $0}
squre

// reduce
let sum = array.reduce(0, combine: {$0 + $1})
sum