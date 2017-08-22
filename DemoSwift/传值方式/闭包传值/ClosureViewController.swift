//
//  ClosureViewController.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/8.
//  Copyright © 2017年 YJ公司. All rights reserved.
//

import UIKit

class ClosureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "闭包传值"
        view.backgroundColor = UIColor.white
        
        view.addSubview(pushButton)
        view.addSubview(textLabel)
    }

   
    lazy var pushButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 24, y: 300, width: KScreenWidth - 48, height: 40)
        btn.backgroundColor = UIColor.red
        btn.setTitle("下一页", for: .normal)
        btn.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 24, y: 100, width: KScreenWidth - 48, height: 150)
        label.font = SYSTEMFONT(size: 16)
        label.backgroundColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.white
        return label
    }()
    
    func pushAction() {
        
        let valueVC = ValueViewController()
        valueVC.passValue = {(text1: String,text2: String) -> Void in
            self.textLabel.text = "姓名：\(text1)" + "   年龄：\(text2)"
        }
        navigationController?.pushViewController(valueVC, animated: true)
    }
    

}
