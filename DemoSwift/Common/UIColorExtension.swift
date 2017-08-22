//
//  UIColorExtension
//  DemoSwift
//
//  Created by Arthur on 2017/8/7.
//  Copyright © 2017年 Arthur. All rights reserved.
//


import Foundation
import UIKit

extension UIColor {
    class func colorWithHex(hex: String, alpha: CGFloat) -> UIColor {
        var rgb: CUnsignedInt = 0;
        let scanner = Scanner(string: hex)
        if hex.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        scanner.scanHexInt32(&rgb)
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0xFF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
    
    class func colorWithHex(hex: String) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1.0)
    }
    
    class func getRandomColor() ->UIColor {
        return UIColor(colorLiteralRed: Float(Float(arc4random_uniform(256))/255.0), green: Float(Float(arc4random_uniform(256))/255.0), blue: Float(Float(arc4random_uniform(256))/255.0), alpha: 1.0)
    }
    
}
