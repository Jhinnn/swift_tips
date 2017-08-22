//
//  DoubanChannel.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/10.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import RealmSwift

class DoubanChannel: Object {
    //频道id
    dynamic var channel_id = ""
    //频道名称
    dynamic var name = ""
    //频道英文名称
    dynamic var name_en = ""
    //排序
    dynamic var seq_id = 0
    dynamic var abbr_en = ""
    
    //设置主键
    override static func primaryKey() -> String? {
        return "channel_id"
    }
}
