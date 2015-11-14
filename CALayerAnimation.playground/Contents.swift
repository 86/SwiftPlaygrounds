//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

let viewWidth: CGFloat = 44.0
let viewHeight: CGFloat = 44.0

// setup base view
var view  = UIView(frame: CGRectMake(0, 0, viewWidth, viewHeight))
view.backgroundColor = UIColor.whiteColor()

// setup indicator bar
let barWidth: CGFloat = 2
let barHeight: CGFloat = 8
let innerRadius: CGFloat = 6;
let barNums = 12
let barColor: UIColor = UIColor.grayColor()

let bar = CALayer()
let barSize = CGSize(width: barWidth, height: barHeight)
bar.bounds = CGRect(x: 0, y: 0, width: barSize.width , height: barSize.height)
bar.position = CGPoint(x: viewWidth / 2, y: viewHeight / 2 - barHeight / 2 - innerRadius)
bar.cornerRadius = barSize.width * 0.5
bar.backgroundColor = barColor.CGColor

// setup CAReplicator layer
let replicatorLayer = CAReplicatorLayer()
replicatorLayer.frame = view.bounds
replicatorLayer.addSublayer(bar)
view.layer.addSublayer(replicatorLayer)

view

// update instance count
var angle = (2.0 * M_PI) / Double(barNums);
replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0.0, 0.0, 1.0);
replicatorLayer.instanceCount = 6

view

replicatorLayer.instanceCount = barNums

view

// common animation settings
let instanceDelay = 0.1
let duration = instanceDelay * Double(barNums)

replicatorLayer.instanceDelay = instanceDelay

// color change animation
let colorFadeAnimation = CABasicAnimation(keyPath: "backgroundColor")
colorFadeAnimation.toValue = UIColor.whiteColor().CGColor
colorFadeAnimation.duration = duration
colorFadeAnimation.repeatCount = .infinity
colorFadeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
bar.addAnimation(colorFadeAnimation, forKey: "colorFadeAnimation")

// rotation animation
let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
rotationAnimation.toValue = 2.0 * M_PI
rotationAnimation.duration = duration * 2
rotationAnimation.repeatCount = .infinity
rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
replicatorLayer.addAnimation(rotationAnimation, forKey: "rotationAnimation")

// scale change animation
let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
scaleAnimation.toValue = 0.9
scaleAnimation.duration = duration / 2
scaleAnimation.autoreverses = true
scaleAnimation.repeatCount = .infinity
scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
replicatorLayer.addAnimation(scaleAnimation, forKey: "scaleAnimation")

// draw animtaion
XCPlaygroundPage.currentPage.liveView = view
