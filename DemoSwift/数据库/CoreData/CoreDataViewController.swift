//
//  CoreDataViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/10.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController,UITextFieldDelegate {
    
    let cellID:String = "section1Cell"
    
    @IBOutlet weak var fatherNameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var IDField: UITextField!
    @IBOutlet weak var tableview: UITableView!
    
    
    var dataArray = [Student]()

    var mycontext : NSManagedObjectContext!;
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "CoreData"
        
        
        tableview.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(G:)))
        view.addGestureRecognizer(tap)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "显示", style: .plain, target: self, action: #selector(showData))

        mycontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    //隐藏键盘
    func tap(G: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return true;
    }
    
    //增加
    @IBAction func AddAction(_ sender: Any) {
        do {
            let inserInfo = NSEntityDescription.insertNewObject(forEntityName: "Student", into: mycontext)
            if (IDField.text != "" && nameField.text != "" && ageField.text != "" && fatherNameField.text != "") {
                inserInfo.setValue(Int(IDField.text!), forKey: "id")
                inserInfo.setValue(nameField.text, forKey: "name")
                inserInfo.setValue(Int(ageField.text!), forKey: "age")
                inserInfo.setValue(fatherNameField.text, forKey: "father")
                
                try mycontext.save()
                
                
                IDField.text = "";
                nameField.text = "";
                ageField.text = "";
                fatherNameField.text = ""
                let myAlert = UIAlertController(title: "提示", message: "保存成功", preferredStyle: .alert);
                let myokAction = UIAlertAction(title: "确定", style: .default, handler: nil);
                myAlert.addAction(myokAction);
                self.present(myAlert, animated: true, completion: nil);
                
                showData()
                
            }else {
                let myAlert = UIAlertController(title: "提示", message: "请输入完整的信息", preferredStyle: .alert);
                let myOkAction = UIAlertAction(title: "确定", style: .default, handler: nil);
                myAlert.addAction(myOkAction);
                self.present(myAlert, animated: true, completion: nil);

            }
            
            
            
        } catch {
            fatalError()
        }
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        
        let fetchRequest = NSFetchRequest<Student>(entityName: "Student")
        do {
            let fetchObjects = try mycontext.fetch(fetchRequest)
            for info in fetchObjects {
                mycontext.delete(info)
            }
            showData()
        } catch {
            fatalError("不能查询：\(error)")
        }
        
    }
    
    
    //查询数据
    func showData() {
        
        dataArray.removeAll()
        tableview.reloadData()
        
        //声明数据请求
        let fetchRequest = NSFetchRequest<Student>(entityName: "Student")
//        fetchRequest.fetchLimit = 2 //限定请求结果的数量
//        fetchRequest.fetchOffset = 1 //查询的偏移量
        
        //设置查询条件
//        let predicate = NSPredicate(format: "id = '1'", "")
//        fetchRequest.predicate = predicate
        
        do {
            let fetchObjects = try mycontext.fetch(fetchRequest)
            
            for info in fetchObjects {
                dataArray.append(info)
            }
            tableview.reloadData()
        } catch {
            fatalError("不能查询：\(error)")
        }
    }
    
    
    //排序
    @IBAction func sortAction(_ sender: Any) {
        
        dataArray.removeAll()
        tableview.reloadData()
        
        //声明数据请求
        let fetchRequest = NSFetchRequest<Student>(entityName: "Student")
        //        fetchRequest.fetchLimit = 2 //限定请求结果的数量
        //        fetchRequest.fetchOffset = 1 //查询的偏移量
        
        let sortDescriptor = NSSortDescriptor(key: "age", ascending: true)  //排序方式
        fetchRequest.sortDescriptors = [sortDescriptor]
        
//        [people sortedArrayUsingDescriptors:@[localizedStandardCompare]]
        //设置查询条件
//        let predicate = NSPredicate(format: "id = '1'", "")
//        fetchRequest.predicate = predicate
        
        do {
            let fetchObjects = try mycontext.fetch(fetchRequest)
            
            for info in fetchObjects {
                dataArray.append(info)
            }
            tableview.reloadData()
        } catch {
            fatalError("不能查询：\(error)")
        }
    }

}

extension CoreDataViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
            cell?.selectionStyle = .none
        }
        
        let stu = dataArray[indexPath.row] 
        
        cell?.textLabel?.text = "学号:\(stu.id)" + "  姓名:\(stu.name!)" + " 年龄:\(stu.age)" + "  父亲: \(stu.father!)"
        cell?.textLabel?.font = SYSTEMFONT(size: 15)
        return cell!
    }
    
}


