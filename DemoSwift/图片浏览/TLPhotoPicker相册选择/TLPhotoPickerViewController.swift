//
//  TLPhotoPickerViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/21.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import TLPhotoPicker
import PhotoBrowserKit


class TLPhotoPickerViewController: UIViewController,TLPhotosPickerViewControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    var urls:[UIImage] = []
    
    lazy var imageView: UIImageView = {
        let imageV = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        return imageV
    }()


    var selectedAssets = [TLPHAsset]()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        title = "TLPhotoPicker"
        
        view.addSubview(imageView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "选择", style: .plain, target: self, action: #selector(chooseAction))
        
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
    
    func chooseAction() {
        let viewController = TLPhotosPickerViewController()
        viewController.delegate = self
        var configure = TLPhotosPickerConfigure()
        configure.doneTitle = "完成"
        configure.cancelTitle = "取消"
        configure.tapHereToChange = "点击这里修改"
        viewController.configure = configure
        present(viewController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        cell.imageView.image = urls[indexPath.row]
        
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var items: [ZYPhotoItem] = []
        for i in 0..<urls.count {
            let cell = collectionView.cellForItem(at: IndexPath(row: i, section: 0)) as? PhotoCell
            let item = ZYPhotoItem()
            // imageView
            item.sourceView = cell?.imageView
//            item.imageURL = URL(string: bigUrl)
            item.image = urls[i]
            item.thunbImage = urls[i]
            items.append(item)
        }
        let browser = ZYPhotoBrowser(photoItems: items, selectedIndex: indexPath.row)
        browser.style = .dot
        browser.showFromViewController(self)
        browser.delegate = self
    }
    
    //TLPhotosPickerViewControllerDelegate
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.selectedAssets = withTLPHAssets
        for asset in self.selectedAssets {
            switch asset.type {
            case .photo:
                print(asset.fullResolutionImage!)
                urls.append(asset.fullResolutionImage!)
            case .video:
                print("视频")
            default:
                print("livePhoto")
            }
        }
        collectionView.reloadData()
    }


    
   
}


extension TLPhotoPickerViewController: ZYPhotoBrowserDelegate {
    func zy_photoBrowser(_ browser: ZYPhotoBrowser, didSelect item: ZYPhotoItem, at index: Int) {
        
        print("did selected index is \(index)")
        
    }
}
