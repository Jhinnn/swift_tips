//
//  DefinitionViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/22.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    var timer:Timer!
    var myProgressBar: ProgressBar!
    var myProgressBar1: ProgressBar!
    var myProgressBar2: ProgressBar!
    
    var i = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "自定义View"
        view.backgroundColor = UIColor.white
        
        setupUI()
        
        myProgressBar = ProgressBar(frame: CGRect(x:0, y:200, width:KScreenWidth, height:60))
        myProgressBar.barColor = UIColor.red
        view.addSubview(myProgressBar)
        
        
        myProgressBar1 = ProgressBar(frame: CGRect(x:0, y:300, width:KScreenWidth - 100, height:30))
        myProgressBar1.barColor = UIColor.yellow
        view.addSubview(myProgressBar1)
        
        myProgressBar2 = ProgressBar(frame: CGRect(x:100, y:400, width:KScreenWidth - 200, height:50))
        myProgressBar2.barColor = UIColor.blue
        view.addSubview(myProgressBar2)
        
        // 启用计时器，控制每秒执行一次tickDown方法
        timer = Timer.scheduledTimer(timeInterval: 0.2,
                                                       target:self,selector:#selector(tickDown),
                                                       userInfo:nil,repeats:true)
   
        
    }
    
    /**
     *计时器每秒触发事件
     **/
    func tickDown() {
        i = i + 1
        myProgressBar.percent = i
        myProgressBar1.percent = i
        myProgressBar2.percent = i
        if i == 100 {
            timer.invalidate()
        }
    }

    
    func setupUI() {
        let Button_Width: CGFloat = KScreenWidth/4
        let imageArray:[String] = ["跟团游图标1","跟团游图标2","跟团游图标3","跟团游图标4"];
        let titleArray:[String] = ["专属顾问","会员俱乐部","常用信息","我的点评"];
        for k in 0..<4 {
            let button = TitleButton()
            button.setTitle(titleArray[k], for: .normal)
            button.frame = CGRect(x: Button_Width * CGFloat(k), y: 64, width: Button_Width, height: Button_Width)
            button.setImage(UIImage(named: imageArray[k]), for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.textAlignment = NSTextAlignment.center
            button.titleLabel?.font = SYSTEMFONT(size: 14)
            view.addSubview(button)
        }
        
    }
    

}
