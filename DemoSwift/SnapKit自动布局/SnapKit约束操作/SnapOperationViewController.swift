//
//  SnapOperationViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/15.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import SnapKit

class SnapOperationViewController: UIViewController {

    var box = UIView()
    var updateButton = UIButton()
    
    var sizeContranint: Constraint?
    var sizeContranint1: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "更新删除约束"
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    //创建
    func setupUI() {
        
        box.backgroundColor = UIColor.orange
        view.addSubview(box)
        
        box.snp.makeConstraints { (make) in
            self.sizeContranint = make.width.height.equalTo(150).constraint
            self.sizeContranint1 = make.left.equalTo(view).offset(10).constraint
            make.top.equalTo(view).offset(80)
        }
        
        
        view.addSubview(updateButton)
        updateButton.backgroundColor = UIColor.red
        updateButton.setTitle("更新约束", for: .normal)
        updateButton.addTarget(self, action: #selector(updateAction), for: .touchUpInside)
        
        updateButton.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.right.equalTo(view).offset(-10)
            make.top.equalTo(view).offset(80)
        }
        
    }
    
    
    //更新约束
    func updateAction() {
//        self.sizeContranint?.deactivate()  //删除约束
//        self.sizeContranint1?.update(offset: 40)  //更新约束
        
        //重做约束(删除之前所有约束)
        box.snp.remakeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
        }
    }
    
//    //视图约束更新
//    override func updateViewConstraints() {
//        self.box.snp.updateConstraints{ (make) -> Void in
//            //视图宽度与屏幕等宽
//            make.width.equalTo(self.view)
//        }
//        
//        super.updateViewConstraints()
//    }
    
    
    

    
}
