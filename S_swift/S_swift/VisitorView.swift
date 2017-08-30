//
//  VisitorView.swift
//  S_swift
//
//  Created by Aaron on 2017/8/30.
//  Copyright © 2017年 Aaron. All rights reserved.
//

import UIKit
import SnapKit

protocol VisitorDelegate:NSObjectProtocol {
    //登陆回调
    func loginBtnClick()
    //注册回调
    func registerBtnClick()
}

class VisitorView: UIView
{
    weak var delegate : VisitorDelegate?
    
    /**
     设置未登录界面
     
     :param: isHome    是否是首页
     :param: imageName 需要展示的图标名称
     :param: message   需要展示的文本内容
     */
    func setupVisitorInfo(isHome:Bool, imageName:String, message:String)
    {
        // 如果不是首页, 就隐藏转盘
        iconView.isHidden = !isHome
        // 修改中间图标
        homeIcon.image = UIImage(named: imageName)
        // 修改文本
        messageLabel.text = message
        
        // 判断是否需要执行动画
        if isHome
        {
            startAnimation()
        }
    }
    
//MARK:自定义视图
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK:开启动画
    private func startAnimation()
    {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.isRemovedOnCompletion = false
        iconView.layer.add(anim, forKey: nil)
    }
    
//MARK:配置视图
    func setupUI()
    {
        // 1.添加子控件
        addSubview(iconView)
        addSubview(maskBGView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        iconView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
        }
        maskBGView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        homeIcon.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        messageLabel.snp.makeConstraints { make in
            make.topMargin.equalTo(iconView.snp.bottom).offset(20)
            make.left.right.equalTo(self).inset(20)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.5)
        }
        registerButton.snp.makeConstraints { make in
            make.width.equalTo(loginButton)
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.centerX.equalTo(loginButton)
        }
    }
    
    // MARK: - 懒加载控件
    /// 转盘
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    /// 图标
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    /// 文本
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.darkGray
        label.text = "打附加赛可垃圾分类考试的减肥了快速的减肥两款手机的两款手机立刻"
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        btn.setTitle("登录", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(VisitorView.loginBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.orange, for: UIControlState.normal)
        btn.setTitle("注册", for: UIControlState.normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(VisitorView.registerBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    private lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
    //MARK:登录注册方法
    func loginBtnClick()
    {
        delegate?.loginBtnClick()
    }
    func registerBtnClick()
    {
       delegate?.registerBtnClick()
    }

}
