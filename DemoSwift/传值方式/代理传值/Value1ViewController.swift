//
//  Value1ViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

//声明一个代理
protocol BackValueDelegate {
    func backValue(text: String, color: UIColor)
}

class Value1ViewController: UIViewController {
    
    var delegate: BackValueDelegate?

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func commitAction(_ sender: Any) {
        self.delegate?.backValue(text: self.textField.text!, color: UIColor.red)
        navigationController?.popViewController(animated: true)
    }

}
