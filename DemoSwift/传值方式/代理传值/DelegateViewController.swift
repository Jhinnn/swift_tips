//
//  DelegateViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "代理传值"
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
        label.textColor = UIColor.white
        return label
    }()
    
    func pushAction() {
        let value1VC = Value1ViewController()
        value1VC.delegate = self
        navigationController?.pushViewController(value1VC, animated: true)
    }

}

extension DelegateViewController: BackValueDelegate {
    func backValue(text: String, color: UIColor) {
        self.textLabel.text = text
        view.backgroundColor = color
    }
}
