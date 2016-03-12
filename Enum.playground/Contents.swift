//: Playground - noun: a place where people can play

import UIKit

/// Enumlation

enum Fruit: String {
    case Apple   = "Apple"
    case Orange  = "Orange"
    case Banana  = "Banana"
    
    static let allValues = [
        Apple.rawValue,
        Orange.rawValue,
        Banana.rawValue,
    ]
    
    var color: UIColor {
        switch self {
        case .Apple: return UIColor.redColor()
        case .Orange: return UIColor.orangeColor()
        case .Banana: return UIColor.yellowColor()
        }
    }
}

let apple = Fruit.Apple
let orange = Fruit(rawValue: "Orange")
let bananaString = Fruit.Banana.rawValue
let appleIndex = Fruit.Apple.hashValue
let fruitsStrings = Fruit.allValues
let appleColor = Fruit.Apple.color


/// Adopt Protocol

protocol Localizable {
    var localizedString: String { get }
}

extension String: Localizable {
    var localizedString: String {
        return NSLocalizedString(self, comment: self)
    }
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    var localizedString: String {
        return NSLocalizedString(self.rawValue, comment: self.rawValue)
    }
}

let orangelocalizedString = Fruit.Orange.rawValue.localizedString

extension Fruit: Localizable {}
let bananalocalizedString = Fruit.Banana.localizedString


/// Asociated Value

enum Either<T>: CustomStringConvertible {
    case Some(T)
    case Error(String)
    
    var description: String {
        switch self {
        case .Some(let T): return "\(T.dynamicType) \(T)"
        case .Error(let error): return "\(error)"
        }
    }
    
    init(value: T?) {
        guard let value = value else {
            self = Error("Initialize failed")
            return
        }
        
        self = Some(value)
    }
}

var number: Either<NSNumber> = Either(value: NSNumber(long: 7))
number = Either(value: nil)


/// nested enum

enum Device {
    enum ScreenType {
        case Unknown
        case Phone3_5
        case Phone4_0
        case Phone4_7
        case Phone5_5
        case Pad
        case PadRetina
        case PadPro
    }
    
    case Unknown
    case Phone(ScreenType)
    case Pad(ScreenType)
    
    init(screen: (width: Double, height: Double, scale: Double)) {
        switch (screen) {
        case ( 320,  480, 2.0): self = .Phone(.Phone3_5)
        case ( 320,  568, 2.0): self = .Phone(.Phone4_0)
        case ( 375,  667, 2.0): self = .Phone(.Phone4_7)
        case ( 414,  736, 3.0): self = .Phone(.Phone5_5)
        case ( 768, 1024, 1.0): self = .Pad(.Pad)
        case ( 768, 1024, 2.0): self = .Pad(.PadRetina)
        case (1024, 1366, 2.0): self = .Pad(.PadPro)
        case (_, _, _):         self = .Unknown
        }
    }
}

let iPhone4 = Device.Phone(.Phone3_5)
let iPhone5 = Device(screen: (width:320, height: 568, scale: 2.0))
let unknown = Device(screen: (width:2048, height: 2722, scale: 2.0))


