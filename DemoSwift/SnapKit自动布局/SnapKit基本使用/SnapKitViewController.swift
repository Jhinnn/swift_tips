//
//  SnapKitViewController.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/9.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        
        let btn1 = UIButton(frame: CGRect(x: 0, y: 70, width: KScreenWidth, height: 40))
        btn1.tag = 101
        btn1.backgroundColor = UIColor.getRandomColor()
        btn1.setTitle("场景1-edges.equalTo", for: .normal)
        btn1.titleLabel?.font = SYSTEMFONT(size: 15)
        btn1.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        view.addSubview(btn1)

        let btn2 = UIButton(frame: CGRect(x: 0, y: btn1.bottom + 10, width: KScreenWidth, height: 40))
        btn2.tag = 102
        btn2.backgroundColor = UIColor.getRandomColor()
        btn2.setTitle("场景2-offset(30) ", for: .normal)
        btn2.titleLabel?.font = SYSTEMFONT(size: 15)
        btn2.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        view.addSubview(btn2)

        let btn3 = UIButton(frame: CGRect(x: 0, y: btn2.bottom + 10, width: KScreenWidth, height: 40))
        btn3.tag = 103
        btn3.backgroundColor = UIColor.getRandomColor()
        btn3.setTitle("场景3-left.right.height.equalTo", for: .normal)
        btn3.titleLabel?.font = SYSTEMFONT(size: 15)
        btn3.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        view.addSubview(btn3)
        
       
        let btn4 = UIButton(frame: CGRect(x: 0, y: btn3.bottom + 10, width: KScreenWidth, height: 40))
        btn4.tag = 104
        btn4.backgroundColor = UIColor.getRandomColor()
        btn4.setTitle("场景4-size.equalTo", for: .normal)
        btn4.titleLabel?.font = SYSTEMFONT(size: 15)
        btn4.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        view.addSubview(btn4)

        let btn5 = UIButton(frame: CGRect(x: 0, y: btn4.bottom + 10, width: KScreenWidth, height: 40))
        btn5.tag = 105
        btn5.backgroundColor = UIColor.getRandomColor()
        btn5.setTitle("场景5-multipliedBy", for: .normal)
        btn5.titleLabel?.font = SYSTEMFONT(size: 15)
        btn5.addTarget(self, action: #selector(self.btnClick(sender:)), for: .touchUpInside)
        view.addSubview(btn5)

        
    }

    func btnClick(sender:UIButton) {
        let vc = SnapDetailViewController()
        vc.type = sender.tag
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
        
    }

}
