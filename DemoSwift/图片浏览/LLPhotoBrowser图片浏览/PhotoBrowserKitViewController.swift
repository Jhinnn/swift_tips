
//
//  LLPhotoBrowserViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/16.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import PhotoBrowserKit

class PhotoBrowserKitViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    var urls:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "PhotoBrowserKit"
        
        urls = ["http://ww4.sinaimg.cn/bmiddle/a15bd3a5jw1f12r9ku6wjj20u00mhn22.jpg",
                "http://ww2.sinaimg.cn/bmiddle/a15bd3a5jw1f01hkxyjhej20u00jzacj.jpg",
                "http://ww4.sinaimg.cn/bmiddle/a15bd3a5jw1f01hhs2omoj20u00jzwh9.jpg",
                "http://ww2.sinaimg.cn/bmiddle/a15bd3a5jw1ey1oyiyut7j20u00mi0vb.jpg",
                "http://ww2.sinaimg.cn/bmiddle/a15bd3a5jw1exkkw984e3j20u00miacm.jpg",
                "http://ww4.sinaimg.cn/bmiddle/a15bd3a5jw1ezvdc5dt1pj20ku0kujt7.jpg",
                "http://ww2.sinaimg.cn/bmiddle/a15bd3a5jw1ey1oyiyut7j20u00mi0vb.jpg",
                "http://ww2.sinaimg.cn/bmiddle/a15bd3a5jw1exkkw984e3j20u00miacm.jpg",
                "http://ww4.sinaimg.cn/bmiddle/a15bd3a5jw1ezvdc5dt1pj20ku0kujt7.jpg"
        ];
        
        setupUI()
        
    }
    
    
    
    
    func setupUI() {
        
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.minimumLineSpacing = 3
        collectionLayout.minimumInteritemSpacing = 3
        collectionLayout.sectionInset = UIEdgeInsets(top: 100, left: 30, bottom: 0, right: 30)  //外边距
        collectionLayout.itemSize = CGSize(width: (KScreenWidth - 60 - 6) / 3, height: (KScreenWidth - 60 - 6) / 3)
        collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight), collectionViewLayout: collectionLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        
        view.addSubview(collectionView)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        if let url = URL(string: urls[indexPath.row]) {
            cell.imageView.kf.setImage(with: url)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var items: [ZYPhotoItem] = []
        for i in 0..<urls.count {
            let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? PhotoCell
            // big url
            let bigUrl = urls[i].replacingOccurrences(of: "bmiddle", with: "large")
            let item = ZYPhotoItem()
            // imageView
            item.sourceView = cell?.imageView
            item.imageURL = URL(string: bigUrl)
            item.thunbImage = cell?.imageView.image
            items.append(item)
        }
        let browser = ZYPhotoBrowser(photoItems: items, selectedIndex: indexPath.row)
        browser.style = .dot
        browser.showFromViewController(self)
        
        browser.delegate = self
    }
    
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        return UIEdgeInsetsMake(5, 5, 5, 5)
//    }
    


    
    
    
    
   

}

extension PhotoBrowserKitViewController: ZYPhotoBrowserDelegate {
    func zy_photoBrowser(_ browser: ZYPhotoBrowser, didSelect item: ZYPhotoItem, at index: Int) {
        
        print("did selected index is \(index)")
        
    }
}
