//
//  Value3ViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class Value3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.white
    }

    
    @IBAction func backAction(_ sender: Any) {
        
        let appDele = UIApplication.shared.delegate as! AppDelegate
        appDele.bgColor = UIColor.blue
        
        
    }
    

}
