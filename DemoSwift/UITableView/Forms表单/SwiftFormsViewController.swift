//
//  SwiftFormsViewController.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/8.
//  Copyright © 2017年 YJ公司. All rights reserved.
//

import UIKit


class SwiftFormsViewController: FormViewController {
    
    
    struct Static {
        static let name = "name"
        static let lastname = "lastname"
        static let emaill = "email"
        static let phone = "phone"
        static let button = "button"
        static let check = "check"
        static let picker = "picker"
        static let categories = "categories"
        static let birthday = "birthday"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "Form表单"
        
        setupForm()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .plain, target: self, action: #selector(SwiftFormsViewController.submit(_:)))
        
    }
    
    // MARK: Actions
    
    func submit(_: UIBarButtonItem!) {
        
        let message = self.form.formValues().description
        
        let alertController = UIAlertController(title: "Form output", message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //创建表单
    private func setupForm() {
        
        let form = FormDescriptor(title: "个人信息")  //表单 标题

        
        let section1 = FormSectionDescriptor(headerTitle: "姓名", footerTitle: nil)
        var row = FormRowDescriptor(tag: Static.name, type: .name, title: "姓")
        row.configuration.cell.appearance = ["textField.placeholder" : "例如：张" as AnyObject, "textField.textAlignment" : NSTextAlignment.right.rawValue as AnyObject];
        section1.rows.append(row)
        
        row = FormRowDescriptor(tag: Static.lastname, type: .name, title: "名")
        row.configuration.cell.appearance = ["textField.placeholder" : "例如：明" as AnyObject, "textField.textAlignment" : NSTextAlignment.right.rawValue as AnyObject];
        section1.rows.append(row)
        
        
        let section2 = FormSectionDescriptor(headerTitle: "邮件", footerTitle: "电话号")
        row = FormRowDescriptor(tag: Static.emaill, type: .email, title: "邮箱")
        row.configuration.cell.appearance = ["textField.placeholder" : "例如：xujiapeng@163.com" as AnyObject, "textField.textAlignment" : NSTextAlignment.right.rawValue as AnyObject, "titleLabel.font" : UIFont.boldSystemFont(ofSize: 17.0)];
        
        section2.rows.append(row)
        
        row = FormRowDescriptor(tag: Static.phone, type: .phone, title: "手机号")
        row.configuration.cell.appearance = ["textField.placeholder" : "例如：187234234" as AnyObject, "textField.textAlignment" : NSTextAlignment.right.rawValue as AnyObject];
        section2.rows.append(row)

        
        //开关
        let section3 = FormSectionDescriptor(headerTitle: "开关", footerTitle: "选择")
        row = FormRowDescriptor(tag: Static.button, type: .booleanSwitch, title: "开关")
        section3.rows.append(row)

        row = FormRowDescriptor(tag: Static.check, type: .booleanCheck, title: "选择")
        section3.rows.append(row)
        
        
        //选择器
        
        let section4 = FormSectionDescriptor(headerTitle: "性别", footerTitle: "生日")
        row = FormRowDescriptor(tag: Static.picker, type: .picker, title: "Gender")
        row.configuration.cell.showsInputToolbar = true
        row.configuration.selection.options = (["F", "M", "U"] as [String]) as [AnyObject]
        row.configuration.selection.optionTitleClosure = { value in
            guard let option = value as? String else { return "" }
            switch option {
            case "F":
                return "Female"
            case "M":
                return "Male"
            case "U":
                return "I'd rather not to say"
            default:
                return ""
            }
        }
        section4.rows.append(row)
        
        row = FormRowDescriptor(tag: Static.categories, type: .multipleSelector, title: "Categories")
        row.configuration.selection.options = ([0, 1, 2, 3, 4] as [Int]) as [AnyObject]
        row.configuration.selection.allowsMultipleSelection = true
        row.configuration.selection.optionTitleClosure = { value in
            guard let option = value as? Int else { return "" }
            switch option {
            case 0:
                return "Restaurant"
            case 1:
                return "Pub"
            case 2:
                return "Shop"
            case 3:
                return "Hotel"
            case 4:
                return "Camping"
            default:
                return ""
            }
        }
        section4.rows.append(row)

        
        row = FormRowDescriptor(tag: Static.birthday, type: .date, title: "Birthday")
        row.configuration.cell.showsInputToolbar = true
        section4.rows.append(row)
        
        
        
        form.sections = [section1,section2,section3,section4]
        
        self.form = form
        
        
    }

    
}
