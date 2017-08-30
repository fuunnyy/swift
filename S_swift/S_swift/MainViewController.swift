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
    //MARK:viewController的生命周期
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.orange
        addChildViewCS()
    }
    override func viewWillAppear(_ animated: Bool)
    {
      super.viewWillAppear(animated)
      setupComposeBtn()
    }
    
    //MARK:添加所有的自控制器
    private func addChildViewCS()
    {
        let path = Bundle.main.path(forResource: "MainVCSettings", ofType: "json")
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do
            {
                let jsonArr = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String:String]]
                for dict in jsonArr
                {
                    _addChildVC(childVC: dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
            }
            catch
            {
                print(error.localizedDescription)
                _addChildVC(childVC: "HomeTableViewController", title: "首页", imageName: "tabbar_home")
                _addChildVC(childVC: "MessageTableViewController", title: "信息", imageName: "tabbar_message_center")
                // 再添加一个占位控制器
                _addChildVC(childVC: "NullViewController", title: "", imageName: "")
                _addChildVC(childVC: "DiscoverTableViewController", title: "广场", imageName: "tabbar_discover")
                _addChildVC(childVC: "ProfileTableViewController", title: "我", imageName: "tabbar_profile")
            }
        }
    }
    
    private func _addChildVC(childVC:String,title:String,imageName:String)
    {
        //获取动态空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        //添加动态空间
        let cls:AnyClass? = NSClassFromString(ns + "." + childVC)
        //设置类类型
        let vcCls = cls as! UIViewController.Type
        //初始化创建
        let vc = vcCls.init()
        
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        vc.title = title

        let nav = UINavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }
    
    //MARK:配置加号
    private func setupComposeBtn()
    {
        tabBar.addSubview(composeBtn)
        let width = UIScreen.main.bounds.size.width / CGFloat((viewControllers?.count)!)
        let rect = CGRect(x: width*2.0, y: 0, width: width, height: 49)
        composeBtn.frame = rect
    }
    
    lazy var composeBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), for: UIControlState.normal)
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(self, action:#selector(MainViewController.composeBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    func composeBtnClick(){
        print(#function)
    }
    
}
