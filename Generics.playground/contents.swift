// Playground - noun: a place where people can play

import UIKit

//: ## Generics playground

// swap two intergers
func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var intA = 1
var intB = 2
swapTwoInts(&intA, &intB)
println("intA: \(intA), intB: \(intB)")

// swap two values (Generics)
func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporayA = a
    a = b
    b = temporayA
}

var strA = "world!"
var strB = "Hello, "
swapTwoValues(&strA, &strB)
println(strA + strB)


// Generics stacker
struct Stack<T: Comparable> {
    var items = [T]()
    mutating func push(item: T){
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var strings = Stack<String>()
strings.push("One")
strings.push("two")
strings.push("Three")
strings.push("Four")
strings.pop()
strings.pop()
strings

// add compare extention
extension Stack {
    func compareForTop (val: T) -> T? {
        if items.isEmpty {
            return val
        } else {
            let topItem = items[items.count - 1]
            return val > topItem ? val : topItem
        }
    }
}

var integers = Stack<Int>()
integers.compareForTop(3)
for i in 1...10 {
    integers.push(i)
}
integers
integers.compareForTop(3)

// add biggers extention
extension Stack {
    func biggers (val: T) -> Array<T>? {
        if items.isEmpty {
            return nil
        } else {
            return items.filter{$0 > val}
        }
    }
}

var floats = Stack<Float>()
floats.biggers(0.3)
for i in 1...10 {
    var float = Float(i) * 0.1
    floats.push(float)
}
floats
floats.biggers(0.3)

