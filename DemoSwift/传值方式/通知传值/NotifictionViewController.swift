//
//  NotifictionViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class NotifictionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "通知传值"
        view.backgroundColor = UIColor.white
    
        NotificationCenter.default.addObserver(self, selector: #selector(getValueAction(info:)), name: NSNotification.Name(rawValue:"passNoticeNotification"), object: nil)
        
        view.addSubview(pushButton)
        view.addSubview(textLabel)
    }
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 24, y: 100, width: KScreenWidth - 48, height: 150)
        label.font = SYSTEMFONT(size: 16)
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var pushButton: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 24, y: 300, width: KScreenWidth - 48, height: 40)
        btn.backgroundColor = UIColor.red
        btn.setTitle("下一页", for: .normal)
        btn.addTarget(self, action: #selector(pushAction), for: .touchUpInside)
        return btn
    }()
    
    func pushAction() {
        let value1VC = Value2ViewController()
        navigationController?.pushViewController(value1VC, animated: true)
    }


    
    func getValueAction(info: NSNotification) {
        let dic = info.userInfo as AnyObject
        textLabel.text = dic["text"] as? String
    }
   
    

   

}
