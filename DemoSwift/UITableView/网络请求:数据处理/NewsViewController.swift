//
//  NewsViewController.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/7.
//  Copyright © 2017年 Arthur. All rights reserved.
//

// SwiftyJSON解析数据  Alamofire请求数据  SVProgressHUD 提示

import UIKit

class NewsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var indentity: String? = nil
    var newsItems = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "新闻"
        view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)
        indentity = "cell"
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: indentity!)
        
        
        weak var weakself = self
        DSNetworkTool.shareNetworkTool.loadNewsInfo { (newsItems) in
            weakself!.newsItems = newsItems
//            weakself!.tableView.reloadData()
            DispatchQueue.main.async{
                weakself!.tableView.reloadData()
            }
        }
    }

    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: KScreenBounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView.init()
        return tableView
    }()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indentity!, for: indexPath) as! NewsCell
        cell.delegate = self
        let newsItem = newsItems[indexPath.row] as! NewsItem
        cell.newsItem = newsItem
        return cell
    }

}

extension NewsViewController: ClickActionDelegate {
    func clickAction(str: String) {
        print(str)
    }
}

