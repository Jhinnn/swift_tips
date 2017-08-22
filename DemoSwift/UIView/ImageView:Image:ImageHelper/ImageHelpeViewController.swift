//
//  ImageHelpeViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/15.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class ImageHelpeViewController: UIViewController {
    
    var imageView: UIImageView!
    
    var imageView1: UIImageView!
    
    var imageView2: UIImageView!
    
    var imageView3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "ImageHelpe使用"
        view.backgroundColor = UIColor.white
        
        
        imageView = UIImageView(frame: CGRect.init(x: 0, y: 64, width: 200, height: 300))
        view.addSubview(imageView)
        imageView.imageFromURL("http://www.iyi8.com/uploadfile/2015/0318/20150318125757634.jpg", placeholder: UIImage.init(named: "23")!, fadeIn: true, shouldCacheImage: true) { (image) in
            print(image as Any)

        }
        
        imageView1 = UIImageView(frame: CGRect(x: 200, y: 64, width: KScreenWidth - 200, height: 100))
        imageView1.image = UIImage(color: UIColor.orange, size: CGSize(width: KScreenWidth - 200, height: 100))?.roundCorners(cornerRadius: 4)
        view.addSubview(imageView1)
        
        
        let gradientColors = [UIColor.yellow, UIColor.orange]
        imageView2 = UIImageView(frame: CGRect(x: 200, y: 64 + 100, width: 100, height: 100))
        imageView2.image = UIImage(gradientColors: gradientColors)?.roundCornersToCircle()
        view.addSubview(imageView2)
        
        imageView3 = UIImageView(frame: CGRect(x: 200, y: 64 + 200, width: KScreenWidth - 200, height: 300))
        let gradientColor = [UIColor(red: 0.996, green: 0.769, blue: 0.494, alpha: 1.0),
                              UIColor(red: 0.969, green: 0.608, blue: 0.212, alpha: 0.2)]
        imageView3.image = UIImage(named: "14")?.apply(gradientColors: gradientColor)
        view.addSubview(imageView3)
        
    }

   

}
