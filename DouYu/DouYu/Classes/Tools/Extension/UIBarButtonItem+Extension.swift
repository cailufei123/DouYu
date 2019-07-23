//
//  UIBarButtonItem+Extension.swift
//  DouYu
//
//  Created by 李勇聪 on 2019/7/14.
//  Copyright © 2019 李勇聪. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    
    //便利构造函数: 1.convenience开头 2.在构造函数中必须明确一个设计的构造函数并且用self调用
    convenience init(imageName: String,heighImageName: String = "",size: CGSize = CGSize.zero){
        let button = UIButton(type: .custom)
        //设置图片
        button.setImage(UIImage(named: imageName), for: .normal)
        if heighImageName != "" {
            button.setImage(UIImage(named: heighImageName), for: .highlighted)
        }
        //设置尺寸
        if size == CGSize.zero {
            button.sizeToFit()
        }else{
            button.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView: button)
        
    }
}
