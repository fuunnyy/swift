//
//  TitleBtn.swift
//  S_swift
//
//  Created by Aaron on 2017/8/30.
//  Copyright © 2017年 Aaron. All rights reserved.
//

import UIKit

class TitleBtn: UIButton {

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), for: UIControlState.normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: UIControlState.selected)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        // Swift中可以这样写
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }

}
