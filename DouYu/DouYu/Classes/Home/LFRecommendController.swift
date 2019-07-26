//
//  LFRecommendController.swift
//  DouYu
//
//  Created by cailufei on 2019/7/23.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
import Alamofire
class LFRecommendController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.red
       
        NetWorkTool.requestData(.get, urlString:  "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentDate()]) { (result) in
            
        }
        
    }
    
}
