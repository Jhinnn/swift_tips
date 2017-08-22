//
//  PersonalCenterViewController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/9.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit

private let NAVBAR_COLORCHANGE_POINT:CGFloat = -150
private let IMAGE_HEIGHT:CGFloat = 260
private let SCROLL_DOWN_LIMIT:CGFloat = 100
private let LIMIT_OFFSET_Y:CGFloat = -(IMAGE_HEIGHT + SCROLL_DOWN_LIMIT)

class PersonalCenterViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight), style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT - 64, 0, 0, 0)
        return tableView
    }()
    
    lazy var imageView: UIImageView = {
        
        let imgView = UIImageView(frame: CGRect(x: 0, y: -IMAGE_HEIGHT, width: KScreenWidth, height: IMAGE_HEIGHT))
        imgView.contentMode = UIViewContentMode.scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = self.imageScaledToSize(image: UIImage(named: "backImage")!, newSize: CGSize(width: KScreenWidth, height: IMAGE_HEIGHT+SCROLL_DOWN_LIMIT))
        return imgView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "个人中心"
        view.backgroundColor = UIColor.white
        tableView.addSubview(imageView)
        view.addSubview(tableView)
        
        navBarBackgroundAlpha = 0
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "··· ", style: .done, target: nil, action: nil)
        
        // 设置导航栏按钮和标题颜色
        navBarTintColor = .white
        
        // 如果需要隐藏导航栏底部分割线，设置 hideShadowImage 为true
        // hideShadowImage = true
        
    }
    
    deinit {
        tableView.delegate = nil
    }

    
}

extension PersonalCenterViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        /*
        let offsetY = scrollView.contentOffset.y   //获得偏移量
        
        if offsetY > NAVBAR_COLORCHANGE_POINT {
            changeNavBarAnimateWithIsClear(isClear: false)
        }else {
            changeNavBarAnimateWithIsClear(isClear: true)
        }
        
        // 限制下拉距离
        if (offsetY < LIMIT_OFFSET_Y) {
            scrollView.contentOffset = CGPoint.init(x: 0, y: LIMIT_OFFSET_Y)
        }
        
        // 改变图片框的大小 (上滑的时候不改变)
        // 这里不能使用offsetY，因为当（offsetY < LIMIT_OFFSET_Y）的时候，y = LIMIT_OFFSET_Y 不等于 offsetY
        let newOffsetY = scrollView.contentOffset.y
        if (newOffsetY < -IMAGE_HEIGHT)
        {
            imageView.frame = CGRect(x: 0, y: newOffsetY, width: KScreenWidth, height: -newOffsetY)
        }
 */
        let offsetY = scrollView.contentOffset.y
        if (offsetY > NAVBAR_COLORCHANGE_POINT)
        {
            let alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / CGFloat(64)
            navBarBackgroundAlpha = alpha
            navBarTintColor = UIColor.black.withAlphaComponent(alpha)
            navBarTitleColor = UIColor.black.withAlphaComponent(alpha)
            statusBarStyle = .default
            title = "wangrui460"
        }
        else
        {
            navBarBackgroundAlpha = 0
            navBarTintColor = .white
            navBarTitleColor = .white
            statusBarStyle = .lightContent
            title = ""
        }
        
        let newOffsetY = scrollView.contentOffset.y
        if (newOffsetY < -IMAGE_HEIGHT)
        {
            imageView.frame = CGRect(x: 0, y: newOffsetY, width: KScreenWidth, height: -newOffsetY)
        }
        
    }
    
    
    fileprivate func imageScaledToSize(image:UIImage, newSize:CGSize) -> UIImage
    {
        UIGraphicsBeginImageContext(CGSize(width: newSize.width * 2.0, height: newSize.height * 2.0))
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width * 2.0, height: newSize.height * 2.0))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? image
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // private
    private func changeNavBarAnimateWithIsClear(isClear:Bool)
    {
        UIView.animate(withDuration: 0.8, animations: { [weak self] in
            if let weakSelf = self
            {
                if (isClear == true) {
                    weakSelf.navBarBackgroundAlpha = 0
                }
                else {
                    weakSelf.navBarBackgroundAlpha = 1.0
                }
            }
        })
    }
}

extension PersonalCenterViewController: UITableViewDelegate {
    
}


extension PersonalCenterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let str = String(format: "WRNavigationBar %zd", indexPath.row)
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:UIViewController = UIViewController()
        vc.view.backgroundColor = UIColor.white
        let str = String(format: "WRNavigationBar %zd", indexPath.row)
        vc.title = str
        navigationController?.pushViewController(vc, animated: true)
    }
}
