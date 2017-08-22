//
//  Section1ViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/8.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class Section00ViewController: UIViewController {

     let cellID:String = "section1Cell"
    var tableView: UITableView?
    
    let titleArray = [
        "网络请求Alamofire/数据解析SwiftyJSON",
        "列表多选rightBarButtonItem/ButtonAction",
        "列表下拉导航栏颜色变化图片放大WRNavigationBar",
        "SwiftForms表单",
        "下拉刷新MJRefresh",
        "TableView嵌套CollectionView",
        "Reusable放肆使用cell"
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


extension Section00ViewController: UITableViewDataSource {
    
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

extension Section00ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            navigationController?.pushViewController(NewsViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(MultipleChoiceViewController(), animated: true)
        case 2:
            navigationController?.pushViewController(PersonalCenterViewController(), animated: true)
        case 3:
            navigationController?.pushViewController(SwiftFormsViewController(), animated: true)
        case 4:
            navigationController?.pushViewController(RefreshViewController(), animated: true)
        case 5:
            navigationController?.pushViewController(TableCollectionViewController(), animated: true)
        case 6:
            navigationController?.pushViewController(ReusableViewController(), animated: true)
        default:
            break
        }
        
        
    }
}

