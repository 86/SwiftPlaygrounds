
import UIKit
import Foundation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely(continueIndefinitely: true)

func startURLSession () {
    if let url = NSURL(string: "http://static.flavors.me/dynamic_images/background/7b1f1d012c7d4273b323efe5ffacba37") {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url, completionHandler: {(
            data: NSData!,
            response: NSURLResponse!,
            error: NSError!) -> Void in
            if (error != nil) {
                println("\(error.localizedDescription): \(error.userInfo)")
            } else if (data != nil) {
                let image = UIImage(data: data!)
            }
        })
        task.resume()
    } else {
        println("invalid url")
    }
}

startURLSession()
