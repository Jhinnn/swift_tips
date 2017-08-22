//
//  SingleViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDele = UIApplication.shared.delegate as! AppDelegate
        view.backgroundColor = appDele.bgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "appdelegate传值"
        view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(Value3ViewController(), animated: true)
    }

  

}
