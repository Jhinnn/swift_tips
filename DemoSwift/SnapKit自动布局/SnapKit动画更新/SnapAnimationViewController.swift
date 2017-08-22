//
//  SnapAnimationViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/15.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class SnapAnimationViewController: UIViewController {
    
    var box = UIView()
    
    var scacle = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "动画"
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    func setupUI() {
     
        box.backgroundColor = UIColor.orange
        view.addSubview(box)
        
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(20 * self.scacle).priority(250)
            make.width.height.lessThanOrEqualTo(self.view.snp.width)
            make.height.height.lessThanOrEqualTo(self.view.snp.height)
            make.center.equalTo(view)
        }
        
        
    }
    override func updateViewConstraints() {
        
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(20 * self.scacle).priority(250)
        }
        super.updateViewConstraints()
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.scacle += 0.4
        self.view.setNeedsUpdateConstraints()
        
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
        }
    }

   
}
