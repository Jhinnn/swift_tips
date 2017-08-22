//
//  UIViewExtension
//  DemoSwift
//
//  Created by Arthur on 2017/8/7.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    //x
    var x : CGFloat!{
        
        get {
            return frame.origin.x
            
        }
        
        set(newValue) {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    // y
    var y : CGFloat!{
        
        get {
            return frame.origin.y
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    // width
    var width : CGFloat!{
        
        get {
            return frame.width
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    // height
    var height : CGFloat!{
        
        get {
            return frame.height
            
        }
        
        set(newValue) {
            var tempFrame : CGRect  = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    // centerX
    var centerX : CGFloat!{
        
        get {
            return center.x
            
        }
        
        set(newValue) {
            center = CGPoint(x: newValue, y: center.y)
        }
    }
    
    // centerY
    var centerY : CGFloat!{
        
        get {
            return center.y
            
        }
        
        set(newValue) {
            center = CGPoint(x: center.x, y: newValue)
            
        }
        
    }
    
    // right
    var right : CGFloat!{
        
        get {
            return x + width
            
        }
        
        set(newValue) {
            
        }
    }
    
    // bottom
    var bottom : CGFloat!{
        
        get {
            return y + height
            
        }
        
        set(newValue) {
            
        }
    }
    
    //coordinate
    var coordinate : CGPoint{
        
        get {
            return frame.origin
            
        }
        
        set(newValue) {
            var tempFrame : CGRect = frame
            tempFrame.origin.x = newValue.x
            tempFrame.origin.y = newValue.y
            frame = tempFrame
            
        }
    }
}
