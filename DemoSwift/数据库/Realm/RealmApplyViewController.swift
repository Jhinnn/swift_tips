//
//  RealmApplyViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/10.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import RealmSwift

class RealmApplyViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView: UITableView? = nil
    
    var consumeItems:Results<DoubanChannel>?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Realm应用"
        view.backgroundColor = UIColor.white
        
        loadData()
        
        tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView.init()
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        view.addSubview(tableView!)
        
        
       
        
    
    }
    
    func loadData() {
     
        // 调用API
        let url = URL(string: "http://www.douban.com/j/app/radio/channels")!
        let response = try! Data(contentsOf: url)
        
        // 对 JSON 的回应数据进行反序列化操作
        let json = try! JSONSerialization.jsonObject(with: response,
                                                     options: .allowFragments) as! [String:Any]
        
        
        let channels = json["channels"] as! [[String:Any]]
        
        let realm = try! Realm()
        try! realm.write {
            // 为数组中的每个元素保存一个对象（以及其依赖对象）
            for channel in channels {
                if channel["seq_id"] as! Int == 0 {continue} //第一个频道数据有问题,丢弃三
                realm.create(DoubanChannel.self, value: channel, update: true)
                
                
            }
        }
        
        
        consumeItems = realm.objects(DoubanChannel.self)
        
        tableView?.reloadData()
    }
    
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.consumeItems!.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //同一形式的单元格重复使用，在声明时已注册
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyCell")
            let item = self.consumeItems?[indexPath.row]
            cell.textLabel?.font = SYSTEMFONT(size: 16)
            cell.detailTextLabel?.font = SYSTEMFONT(size: 13)
            cell.textLabel?.text = (item?.channel_id)!
            cell.detailTextLabel?.text = (item?.name)!
            return cell
    }


   

}
