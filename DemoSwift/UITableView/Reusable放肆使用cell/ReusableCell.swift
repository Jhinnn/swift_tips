//
//  ReusableCell.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/22.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import Reusable

class ReusableCell: UITableViewCell,NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
