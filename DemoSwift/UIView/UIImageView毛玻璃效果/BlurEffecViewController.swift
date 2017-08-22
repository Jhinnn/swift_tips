
//
//  BlurEffecViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/15.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class BlurEffecViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "毛玻璃实例"
        view.backgroundColor = UIColor.white
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 64, width: KScreenWidth, height: KScreenHeight))
        imageView.image = UIImage(named: "23")
        view.addSubview(imageView)
        
         //首先创建一个模糊效果
        let blurEffect = UIBlurEffect(style: .light)
        
        //接着创建一个承载模糊效果的视图
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        //设置模糊视图的大小（全屏）
        blurView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        
        view.addSubview(blurView)
    }

    
}
