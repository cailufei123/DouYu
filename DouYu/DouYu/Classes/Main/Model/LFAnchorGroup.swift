//
//  LFAnchorGroup.swift
//  DouYu
//
//  Created by cailufei on 2019/8/6.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit

class LFAnchorGroup: NSObject {
///房间数组
    @objc var room_list : [LFAnchorModel]?
     ///组名称
    @objc var tag_name : String?
    @objc var icon_name : String = "home_header_normal"

//    override static func mj
 
  override  static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["room_list":NSStringFromClass(LFAnchorModel.self)]
    }
    
//    static func mj_replacedKeyFromPropertyName() -> [AnyHashable : Any]! {
//          return ["ID" :"id"]
//    }
}
