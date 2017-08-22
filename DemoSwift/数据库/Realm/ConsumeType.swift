//
//  ConsumeType.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/10.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import RealmSwift

//消费类型
class ConsumeType:Object {
    //类型名
    dynamic var name = ""
}

//消费条目
class ConsumeItem:Object {
    //条目名
    dynamic var name = ""
    //金额
    dynamic var cost = 0.00
    //时间
    dynamic var date = Date()
    //所属消费类别
    dynamic var type:ConsumeType?
}
