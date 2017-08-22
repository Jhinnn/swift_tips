//
//  RefreshViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/11.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import MJRefresh

class RefreshViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var items:[String]!
    var tableView:UITableView?
    
    // 顶部刷新
    let header = MJRefreshGifHeader()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "下拉刷新"
        //随机生成一些初始化数据
        refreshItemData()

        //创建表视图
        self.tableView = UITableView(frame: self.view.frame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //下拉刷新相关设置
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        
        //下拉过程时的图片集合(根据下拉距离自动改变)
        var idleImages = [UIImage]()
        for i in 1...4 {
            idleImages.append(UIImage(named:"deliveryStaff\(i)")!)
        }
        header.setImages(idleImages, for: .idle) //idle1，idle2，idle3...idle10
        
        //下拉到一定距离后，提示松开刷新的图片集合(定时自动改变)
        var pullingImages = [UIImage]()
        for i in 1...4 {
            pullingImages.append(UIImage(named:"deliveryStaff\(i)")!)
        }
        header.setImages(pullingImages, for: .pulling)
        
        //刷新状态下的图片集合(定时自动改变)
        var refreshingImages = [UIImage]()
        for i in 1...4 {
            refreshingImages.append(UIImage(named:"deliveryStaff\(i)")!)
        }
        header.setImages(refreshingImages, for: .refreshing)
        
        
        header.lastUpdatedTimeLabel.isHidden = true
        header.stateLabel.isHidden = true
        self.tableView!.mj_header = header
        
        
        
        
    }
    
    //初始化数据
    func refreshItemData() {
        items = []
        for _ in 0...9 {
            items.append("条目\(Int(arc4random()%100))")
        }
    }

    //顶部下拉刷新
    func headerRefresh(){
        print("下拉刷新.")
        sleep(2)
        //重现生成数据
        refreshItemData()
        //重现加载表格数据
        self.tableView!.reloadData()
        //结束刷新
        self.tableView!.mj_header.endRefreshing()
    }
    
    //在本例中，只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
            let identify:String = "SwiftCell"
            //同一形式的单元格重复使用，在声明时已注册
            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                     for: indexPath)
//            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.font = SYSTEMFONT(size: 16)
            cell.textLabel?.text = self.items[indexPath.row]
            return cell
    }
    

}
