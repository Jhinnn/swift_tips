//
//  ReusableViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/22.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import Reusable

class ReusableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Resuable放肆用cell"
        view.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    func setupUI() {
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.register(cellType: ReusableCell.self)
        self.view.addSubview(self.tableView!)
        
        self.tableView?.tableHeaderView = ResuableView.loadFromNib()
    }

    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell: ReusableCell = tableView.dequeueReusableCell(for: indexPath)
           
            let label = cell.contentView.viewWithTag(11) as! UILabel
            label.font = SYSTEMFONT(size: 16)
            label.text = "第" + String(indexPath.row) + "列"
            return cell
    }

    
}
