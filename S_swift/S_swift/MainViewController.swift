//
//  MainViewController.swift
//  S_swift
//
//  Created by Aaron on 2017/8/29.
//  Copyright © 2017年 Aaron. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.orange
        _addChildVC(childVC: HomeTableViewController(), title: "首页", imageName: "tabbar_home")
        _addChildVC(childVC: MessageTableViewController(), title: "信息", imageName: "tabbar_message_center")
        _addChildVC(childVC: DiscoverTableViewController(), title: "广场", imageName: "tabbar_discover")
        _addChildVC(childVC: ProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    private func _addChildVC(childVC:UIViewController,title:String,imageName:String)
    {
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")
        childVC.title = title

        let nav = UINavigationController()
        nav.addChildViewController(childVC)
        addChildViewController(nav)
    }
}
