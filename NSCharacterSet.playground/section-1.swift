// Playground - noun: a place where people can play

import UIKit
import Foundation

let alphanumericSet = NSCharacterSet.alphanumericCharacterSet()
var allowStringSet = NSMutableCharacterSet(charactersInString: "_")
allowStringSet.formUnionWithCharacterSet(alphanumericSet)


let checkTrueSet = NSCharacterSet(charactersInString: "1234ab_cd")
let checkFalseSet = NSCharacterSet(charactersInString: "!@#$_")

allowStringSet.isSupersetOfSet(checkTrueSet)
allowStringSet.isSupersetOfSet(checkFalseSet)
