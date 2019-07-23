//
//  UIColor+Extension.swift
//  JinRiTouTiao
//
//  Created by 李勇聪 on 2019/7/4.
//  Copyright © 2019 ribencun. All rights reserved.
//  UIColor添加扩展

import UIKit

extension UIColor{
    //便利构造函数
    convenience init(r: CGFloat,g: CGFloat,b: CGFloat,alpha: CGFloat = 1.0) {
        if #available(iOS 10.0, *) {
            self.init(displayP3Red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        } else {
            self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
        }
    }
    
    //类方法
    class func globalBackGroundColor() -> UIColor {
        return UIColor(r: 248, g: 249, b: 247)
    }
}
