//
//  BaseTableViewController.swift
//  S_swift
//
//  Created by Aaron on 2017/8/30.
//  Copyright © 2017年 Aaron. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController
{
    //定义一个变量标记登陆状态
    var usrLogin = false
    var visitorView:VisitorView? = nil
    
    
    override func loadView()
    {
        usrLogin ? super.loadView() : setupVisitorView()
    }
    
    //MARK:配置未登录状态
    private func setupVisitorView()
    {
        let customView = VisitorView()
        customView.delegate = self
        view = customView
        visitorView = customView
    
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseTableViewController.loginBtnClick))
    }
}

extension BaseTableViewController:VisitorDelegate
{
    // MARK: - VisitorViewDelegate
    func loginBtnClick() {
        print(#function)
    }
    func registerBtnClick() {
        print(#function)
    }
}
