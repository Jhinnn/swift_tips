//
//  TableCollectionViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/15.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

struct BookPreview {
    var title: String
    var images: [String]
}

class TableCollectionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let books = [
        BookPreview(title: "美女", images: ["11","12","13","14","15","16"]),
        BookPreview(title: "风景", images: ["21","22","23","24"]),
        BookPreview(title: "书籍", images: ["31","32","33","34","35","36","37"])
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "图集"

        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //去除单元格分隔线
        self.tableView!.separatorStyle = .none
        
        //创建一个重用的单元格
        self.tableView!.register(UINib(nibName:"MyBookTableViewCell", bundle:nil),
                                 forCellReuseIdentifier:"myCell")
        
        //设置estimatedRowHeight属性默认值
        self.tableView!.estimatedRowHeight = 44.0
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableView!.rowHeight = UITableViewAutomaticDimension
        
    }
    
    //在本例中，只有一个分区
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //返回表格行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.count
    }
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
                as! MyBookTableViewCell
            
            //下面这两个语句一定要添加，否则第一屏显示的collection view尺寸，以及里面的单元格位置会不正确
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            
            //重新加载单元格数据
            cell.reloadData(title:books[indexPath.row].title,
                            images: books[indexPath.row].images)
            return cell
    }

   

}
