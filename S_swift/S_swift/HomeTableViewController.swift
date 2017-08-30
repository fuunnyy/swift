//
//  HomeTableViewController.swift
//  S_swift
//
//  Created by Aaron on 2017/8/29.
//  Copyright © 2017年 Aaron. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if !usrLogin
        {
           visitorView?.setupVisitorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
        }
        
        setupNav()
    }
    
    //MARK:自定义导航控制器
    private func setupNav()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"navigationbar_friendattention"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeTableViewController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"navigationbar_pop"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(HomeTableViewController.rightItemClick))
        // 2.初始化标题按钮
        let titleBtn = TitleBtn()
        titleBtn.setTitle("sdfas", for: UIControlState.normal)
//        titleBtn.addTarget(self, action:Selector("HomeTableViewController.titleBtnClick:"), for: UIControlEvents.touchUpInside)
        titleBtn.addTarget(self, action: Selector("titleBtnClick()"), for: UIControlEvents.touchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    func titleBtnClick(btn: TitleBtn)
    {
        btn.isSelected = !btn.isSelected
    }
    func leftItemClick()
    {
        print(#function)
    }
    func rightItemClick()
    {
        print(#function)
    }

}

extension HomeTableViewController
{
    
}


