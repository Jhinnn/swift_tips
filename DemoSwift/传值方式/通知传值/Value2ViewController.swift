//
//  Value2ViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class Value2ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    
    @IBAction func commitAction(_ sender: Any) {
        
        let noticName = NSNotification.Name("passNoticeNotification")
        NotificationCenter.default.post(name: noticName, object: self, userInfo: ["text" : textField.text!])
        
        navigationController?.popViewController(animated: true)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

}
