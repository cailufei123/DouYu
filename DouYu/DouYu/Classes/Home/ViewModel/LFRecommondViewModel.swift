//
//  LFRecommondViewModel.swift
//  DouYu
//
//  Created by cailufei on 2019/7/24.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit




class LFRecommondViewModel: NSObject {
  lazy var anchorGroup :  [LFAnchorGroup] = [LFAnchorGroup]()
private  lazy var bigDataGroup :  LFAnchorGroup = LFAnchorGroup()
private  lazy var prettyGroup :  LFAnchorGroup = LFAnchorGroup()
    var cycleModels : [CycleModel]?
}
//发送网络请求
extension LFRecommondViewModel{
    func requestData(finshedCallBack:@escaping () -> ()) {
            //请求参数
            var params = [String:Any]()
            params["limit"] = "4"
            params["offset"] = "0"
            params["time"] = NSDate.getCurrentDate()
            
            let group = DispatchGroup()
            
            //推荐数据
            group.enter()
            NetworkTool.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentDate()]) { (result) in
            //把result转成对应的字典类型
            guard let resultDict = result as? [String : Any] else {
            return
            }
           
            
            self.bigDataGroup.tag_name  = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            self.bigDataGroup.room_list =  LFAnchorModel.mj_objectArray(withKeyValuesArray: resultDict["data"]) as?[LFAnchorModel]
            
          
             group.leave()
            }
        
            
            
            //颜值数据
             group.enter()
            NetworkTool.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: params) { (result) in
            //把result转成对应的字典类型
            guard let resultDict = result as? [String : Any] else {
            return
            }
          
            self.prettyGroup.tag_name  = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            self.prettyGroup.room_list =  LFAnchorModel.mj_objectArray(withKeyValuesArray: resultDict["data"]) as?[LFAnchorModel]
            
          
                 group.leave()
            }
            //热门游戏数据
            //请求后面的游戏数据
             group.enter()
            NetworkTool.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: params) { (result) in
                guard let resultDict  = result as? [String : Any] else{
                    return
               }
             
                print(resultDict)
                let anchorGroup = LFAnchorGroup.mj_objectArray(withKeyValuesArray: resultDict["data"]) as? [LFAnchorGroup]
                guard let anchorGroups = anchorGroup else {
                    return
                }
                self.anchorGroup.append(contentsOf: anchorGroups)
                 group.leave()
            }
            
            group.notify(queue: DispatchQueue.main){
              
                self.anchorGroup.insert(self.prettyGroup, at: 0)
                self.anchorGroup.insert(self.bigDataGroup, at: 0)
              
               finshedCallBack()
                
            }
    }
    
    func requestCycleData(finishCallback: @escaping () ->() ) {
      
        NetworkTool.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version":"2.300"]) { (result) in
               // 1.获取整体字典数据
            guard let resultDict = result as?[String : Any] else{return}
       self.cycleModels = CycleModel.mj_objectArray(withKeyValuesArray: resultDict["data"]) as?[CycleModel]
//            for rere in  self.cycleModels!  {
//                print(rere.pic_url)
//            }
//             print(resultDict)
           
       finishCallback()
        }
    }
}
