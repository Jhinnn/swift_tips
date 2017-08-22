//
//  PPNumberButtonViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/22.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import PPNumberButtonSwift


class PPNumberButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "商品计数"
        view.backgroundColor = UIColor.white
        
        example1()
        example2()
        

    }
    
    
    func example1() {
        let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 160, width: 100, height: 30))
        //设置边框颜色
        numberButton.borderColor(UIColor.gray)
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            print(number)
        }
        view.addSubview(numberButton)
    }

    
    
    func example2() {
        let numberButton = PPNumberButton.init(frame: CGRect(x: 100, y: 220, width: 150, height: 44))
        //设置加减按钮的标题
        numberButton.setTitle(decreaseTitle: "减", increaseTitle: "加")
        //设置加减按钮标题的字体大小
        
        numberButton.borderColor(UIColor.gray)
        numberButton.buttonTitleFont(UIFont.systemFont(ofSize: 15))
        //开启抖动动画
        numberButton.shakeAnimation = true
        //加减按钮的闭包回调
        numberButton.numberResult { (number) in
            
            print(number)
        }
        
        view.addSubview(numberButton)
    }
    

}
