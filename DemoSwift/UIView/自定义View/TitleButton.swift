//
//  TitleButton.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/22.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: 0, y: self.height/4*3, width: self.width, height: self.height/4)
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return CGRect(x: self.width/4, y: 10, width: self.width/2, height: self.width/2)
    }

}
