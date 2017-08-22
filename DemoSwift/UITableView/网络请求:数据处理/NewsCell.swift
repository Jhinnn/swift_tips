//
//  NewsCell.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/7.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import Kingfisher

protocol ClickActionDelegate {
    func clickAction(str: String)
}


class NewsCell: UITableViewCell {
    
    
    var delegate: ClickActionDelegate?
    
    var newsItem: NewsItem? {
        didSet {
            
            let url = URL(string: (newsItem?.image_url_small)!)
            imageV.kf.setImage(with: ImageResource(downloadURL: url!))
            
            titleLabel.text = newsItem?.title
            contentLabel.text = newsItem?.summary
        }
    }
    
    
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = SYSTEMFONT(size: 16)
        contentLabel.font = SYSTEMFONT(size: 14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
       self.delegate?.clickAction(str: contentLabel.text!)
    }
    
    
    
}
