//
//  ViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/8.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellID:String = "homeCellID"
    var tableView: UITableView?
    
    
    var titleArray = [[String]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Demo"
    
        view.backgroundColor = UIColor.white
        
        constructionArray()
        
        setupTableView()
    }
    
    func constructionArray() {
        
        let sectionArray1 = ["UITableView","UIScorllView","UIStackView","UIView"]
        let sectionArray2 = ["SnapKit布局"]
        let sectionArray3 = ["数据存储"]
        let sectionArray4 = ["传值方式"]
        let sectionArray5 = ["图片浏览"]
        let sectionArray6 = ["选择器"]
        
        titleArray.append(sectionArray1)
        titleArray.append(sectionArray2)
        titleArray.append(sectionArray3)
        titleArray.append(sectionArray4)
        titleArray.append(sectionArray5)
        titleArray.append(sectionArray6)
    }
    
    func setupTableView() {
        
        tableView = UITableView(frame: KScreenBounds, style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 40
        tableView?.tableFooterView = UIView.init()
        view.addSubview(tableView!)
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 20))
        label.text = "    第\(section)列"
        label.font = SYSTEMFONT(size: 12)
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = titleArray[section]
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
            cell?.accessoryType = .disclosureIndicator
            cell?.selectionStyle = .none
        }
        let array = titleArray[indexPath.section]
        cell?.textLabel?.text = array[indexPath.row]
        cell?.textLabel?.font = SYSTEMFONT(size: 15)
        return cell!
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section00ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            case 1:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section01ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            case 2:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section02ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            case 3:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section03ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section10ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section20ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)

            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = PassValueViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
            
        case 4:
            switch indexPath.row {
            case 0:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section40ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                let array = titleArray[indexPath.section]
                let title = array[indexPath.row]
                let vc = Section50ViewController()
                vc.navigationItem.title = title
                navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        default:
            break
        }
    
    }
}
