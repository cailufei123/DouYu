//
//  NetWorkTool.swift
//  DouYu
//
//  Created by cailufei on 2019/7/24.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
     case post
}
class NetWorkTool: NSObject {
    class func requestData(_ type : MethodType , urlString : String , parameters:[String : Any]?, finishedCallback :@escaping (_ result : Any) -> ()){
      // 1.获取类型
        
        let method = type == MethodType.get ? HTTPMethod.get : HTTPMethod.post
        
//        let headers : HTTPHeaders =
        
//        let headers: HTTPHeaders = [
//
//            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//            "Accept": "application/json"
//        ]
          // 2.发送网络请求
        Alamofire.request(urlString, method: method, parameters: parameters, headers: nil ).responseJSON { (response) in
              // 3.获取结果
            guard let result = response.result.value  else {
                  print(response.result.error!)
                return
            }
            
            finishedCallback(result)
        }
       
        
        
     
        }

}
