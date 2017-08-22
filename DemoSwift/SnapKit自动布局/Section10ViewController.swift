//
//  Section2ViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/9.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class Section10ViewController: UIViewController {

    let cellID:String = "section1Cell"
    var tableView: UITableView?
    
    let titleArray = [
        "自动布局SnapKit",
        "更新删除约束SnapKit",
        "动画更新约束SnapKit"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
    }
    
    func setupTableView() {
        
        tableView = UITableView(frame: KScreenBounds, style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 40
        tableView?.tableFooterView = UIView.init()
        view.addSubview(tableView!)
        
    }
    
    
    
}


extension Section10ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
            cell?.accessoryType = .disclosureIndicator
            cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = titleArray[indexPath.row]
        cell?.textLabel?.font = SYSTEMFONT(size: 15)
        return cell!
    }
    
}

extension Section10ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(SnapKitViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(SnapOperationViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(SnapAnimationViewController(), animated: true)
        default:
            break
            
        }
    }
}
