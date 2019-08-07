//
//  LFAnchorModel.swift
//  DouYu
//
//  Created by cailufei on 2019/8/6.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFAnchorModel: NSObject {
    var room_id : Int  = 0
     ///图片
   @objc  var vertical_src : String = ""
      ///是手机直播还是电脑直播
     @objc var isVertical : Int = 0
    @objc var room_name : String = ""
    ///主播名称称
    @objc var nickname : String = ""
    ///游戏名称
    @objc var game_name : String = ""
    ///在线人数
    @objc var online : Int = 0
    ///城市
    @objc var anchor_city : String = ""
    
}
