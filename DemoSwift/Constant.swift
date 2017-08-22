//
//  Config.swift
//  Travel
//
//  Created by Arthur on 2017/7/17.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

let KScreenWidth = UIScreen.main.bounds.size.width
let KScreenHeight = UIScreen.main.bounds.size.height
let KScreenBounds = UIScreen.main.bounds


let kGlobalColor = RGB(r: 42, g: 177, b: 68)
let kLineColor = HEXCOLOR(hex: 0xe5e5e5)


let CHINESE_FONT_NAME = "Heiti SC"
func SYSTEMFONT(size: CGFloat) -> UIFont{
    return UIFont(name: CHINESE_FONT_NAME, size: size)!
}

func RGB(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func HEXCOLOR(hex: NSInteger) -> UIColor {
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1.0)
}


func ViewBorderRadius(view: UIView, radius: CGFloat, width: CGFloat, color: UIColor) {
    view.layer.masksToBounds = true
    view.layer.cornerRadius = radius
    view.layer.borderWidth = width
    view.layer.borderColor = color.cgColor
}


let RETURN_OK = "True"
