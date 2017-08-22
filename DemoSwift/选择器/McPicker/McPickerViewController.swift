//
//  McPickerViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/21.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import McPicker

class McPickerViewController: UIViewController {
    
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: KScreenWidth - 200, height: 40))
        label.font = SYSTEMFONT(size: 18)
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    
    lazy var popoverButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 200, width: KScreenWidth - 200, height: 40)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.black
        button.titleLabel?.textAlignment = NSTextAlignment.center
        button.addTarget(self, action: #selector(show(_:)), for: .touchUpInside)
        return button
    
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "McPicker"
        
        view.addSubview(self.textLabel)
        view.addSubview(self.popoverButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        self.textLabel.isUserInteractionEnabled = true
        self.textLabel.addGestureRecognizer(tap)
        
        
    
    }

    func tapAction() {
        McPicker.show(data: [["1","2","3"]]) { (selections: [Int : String]) in
            if let name = selections[0] {
                print(selections)
                self.textLabel.text = name
            }
        }
    }
    
    func show(_ sender: Any) {
        
        let data: [[String]] = [
            ["Sir", "Mr", "Mrs", "Miss"],
            ["Kevin", "Lauren", "Kibby", "Stella"]
        ]
        
        let mcPicker = McPicker(data: data)
        
        if let barButton = sender as? UIBarButtonItem {
            // Show as Popover
            //
            mcPicker.showAsPopover(fromViewController: self, barButtonItem: barButton) { (selections: [Int : String]) -> Void in
                if let prefix = selections[0], let name = selections[1] {
                    self.popoverButton.titleLabel?.text = name + prefix
                }
            }
        } else {
            // Show Normal
            //
            mcPicker.show { selections in
                if let prefix = selections[0], let name = selections[1] {
                    self.popoverButton.setTitle(prefix + " " + name, for: .normal)
                }
            }
        }
    }
    
    
    
   
        
    
}
