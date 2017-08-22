//
//  ValueViewController.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/8.
//  Copyright © 2017年 YJ公司. All rights reserved.
//

import UIKit


typealias passValueClosure = (String,String) ->Void  //定义闭包类型

class ValueViewController: UIViewController {
    
    
    var passValue: passValueClosure?
    

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "闭包传值"
        view.backgroundColor = UIColor.white
    }

    @IBAction func commitAction(_ sender: Any) {
        
        if passValue != nil {
            self.passValue!(textField1.text!,textField2.text!)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    

}
