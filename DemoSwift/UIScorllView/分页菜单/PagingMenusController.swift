//
//  PagingMenuController.swift
//  DemoSwift
//
//  Created by Arthur on 2017/8/14.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import PagingMenuController

//分页菜单配置
private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    
    //默认显示第2页
    var defaultPage: Int = 0
    
    //页面切换动画播放时间为0.5秒
    var animationDuration: TimeInterval = 0.5
    
    

    
    //不允许手指左右滑动页面切换
//    var isScrollEnabled: Bool = false
    
    //页面背景色为紫色
//    var backgroundColor: UIColor = .purple
    
    //lazy loading的页面数量（默认值就是.three）
    var lazyLoadingPage: LazyLoadingPage = .three
    
    //不太清楚干嘛用的（默认值就是.multiple）
    var menuControllerSet: MenuControllerSet = .multiple
    
    private let viewcontroller1 = PageOneViewController()
    private let viewcontroller2 = PageTwoViewController()
    private let viewcontroller3 = PageThreeViewController()
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    //所有子视图控制器
    fileprivate var pagingControllers: [UIViewController] {
        return [viewcontroller1, viewcontroller2,viewcontroller3]
    }
    
    //菜单配置项
    fileprivate struct MenuOptions: MenuViewCustomizable {
        
//        var backgroundColor: UIColor = UIColor.yellow
        
        //菜单显示模式（标准模式）
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        
        var focusMode: MenuFocusMode = .underline(height: 1.5, color: .orange, horizontalPadding: 45,
                                                  verticalPadding: 0)
        
        //设置未选中的菜单标签背景为深灰色
//        var backgroundColor: UIColor = .darkGray
//        
//        //设置选中的菜单标签背景为浅浅灰色
        var selectedBackgroundColor: UIColor = .lightText
    
        
        //设置菜单标签高度为40
        var height: CGFloat = 40
        
    
        //菜单项
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3()]
        }
    }
    
    //第1个菜单项
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "个性推荐",color: UIColor.black,selectedColor: UIColor.orange))
            
            
        }
        
        
    }
    
    //第2个菜单项
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "主播电台",color: UIColor.black,selectedColor: UIColor.orange))
        }
    }
    
    //第3个菜单项
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        //自定义菜单项名称
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "排行榜",color: UIColor.black,selectedColor: UIColor.orange))
        }
    }

}

class PagingMenusController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.white
        title = "分页菜单"
        
        //分页菜单配置
        let options = PagingMenuOptions()
        //分页菜单控制器初始化
        let pagingMenuController = PagingMenuController(options: options)
        //分页菜单控制器尺寸设置
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        
        //建立父子关系
        addChildViewController(pagingMenuController)
        //分页菜单控制器视图添加到当前视图中
        view.addSubview(pagingMenuController.view)
        
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print("--- 标签将要切换 ---")
                print("老标签：\(previousMenuItemView.titleLabel.text!)")
                print("新标签：\(menuItemView.titleLabel.text!)")
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print("--- 标签切换完毕 ---")
                print("老标签：\(previousMenuItemView.titleLabel.text!)")
                print("新标签：\(menuItemView.titleLabel.text!)")
            case let .willMoveController(menuController, previousMenuController):
                print("--- 页面将要切换 ---")
                print("老页面：\(previousMenuController)")
                print("新页面：\(menuController)")
            case let .didMoveController(menuController, previousMenuController):
                print("--- 页面切换完毕 ---")
                print("老页面：\(previousMenuController)")
                print("新页面：\(menuController)")
            case .didScrollStart:
                print("--- 分页开始左右滑动 ---")
            case .didScrollEnd:
                print("--- 分页停止左右滑动 ---")
            }
        }
    }

    
}
