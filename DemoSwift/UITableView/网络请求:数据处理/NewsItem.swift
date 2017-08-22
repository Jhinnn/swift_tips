//
//  NewsItem.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/7.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

class NewsItem: NSObject {
    
    var image_url_small: String?
    var publication_date: String?
    var summary: String?
    var title: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        image_url_small = dict["image_url_small"] as? String
        publication_date = dict["publication_date"] as? String
        summary = dict["summary"] as? String
        title = dict["title"] as? String
        
    }

}
