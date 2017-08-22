//
//  RealmViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/10.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import RealmSwift

class RealmViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView? = nil
    
    let realm = try!  Realm()
    
    var dformatter = DateFormatter()
    
    //保存从数据库中查询出来的结果集
    var consumeItems:Results<ConsumeItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        title = "Realm"
    
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "新增", style: .done, target: self, action: #selector(addData))
        
        self.dformatter.dateFormat = "MM月dd日 HH:mm"
    
//        print(realm.configuration.fileURL) //realm文件地址
        
        consumeItems = realm.objects(ConsumeItem.self)
        
        setupUI()
    }
    
    //创建tableVIew
    func setupUI() {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - 50), style: .plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView.init()
        tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        view.addSubview(tableView!)
        
        
        let bottomView: UIView = UIView(frame: CGRect(x: 0, y: KScreenHeight - 50, width: KScreenWidth, height: 50))
        bottomView.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(bottomView)
        
        
        let titleArray = ["排序","筛选","删除"]
        for i in 0..<3 {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x:CGFloat(i) * KScreenWidth/3, y: 0, width: KScreenWidth/3, height: 50)
            button.setTitle(titleArray[i], for: .normal)
            button.titleLabel?.font = SYSTEMFONT(size: 17)
            button.tag = i + 100
            button.addTarget(self, action: #selector(action(sender:)), for: .touchUpInside)
            button.backgroundColor = UIColor.red
            bottomView.addSubview(button)
        }
    }
    
    
    func action(sender: UIButton) {
        switch sender.tag {
        case 100:  //排序
            consumeItems = realm.objects(ConsumeItem.self).sorted(byKeyPath: "cost", ascending: true)
        case 101:
            consumeItems = realm.objects(ConsumeItem.self).filter("cost > 50").sorted(byKeyPath: "date", ascending: true)
            
        case 102:
            try! realm.write {
                realm.deleteAll()
            }
            
        default:
            break
        }
        tableView?.reloadData()
    }
    
    
    //新增数据
    func addData() {
    
        //创建两个消费类型
        let type = ConsumeType()
        type.name = "吃饭"
        
        let pirce = Int(arc4random()%100)+1
        let date = -(Double(arc4random()%10000000)+1000000)
        
        
        let index = Int(arc4random()%4)
        let titleArray = ["晚饭","早饭","夜宵","朋友聚餐"]
        
        //创建3个消费记录
        let item = ConsumeItem(value: [titleArray[index],pirce,NSDate(timeIntervalSinceNow: date),type])
        
        try! realm.write {
            realm.add(item)
        }
        
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
            cell.textLabel?.text = (item?.name)! + " ￥" + String(format: "%.1f", (item?.cost)!)
            cell.detailTextLabel?.text = self.dformatter.string(from: (item?.date)!)
            return cell
    }
    
    
    
    
    
}
