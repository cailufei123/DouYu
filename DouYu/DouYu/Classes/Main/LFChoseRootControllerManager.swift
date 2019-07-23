//
//  LFChoseRootControllerManager.swift
//  DouYu
//
//  Created by cailufei on 2019/7/22.
//  Copyright © 2019 cailufei. All rights reserved.
//

import UIKit
//var CYLTabBarItemTitle : String = "CYLTabBarItemTitle"
//let CYLTabBarItemImage : String = "CYLTabBarItemImage"
//let CYLTabBarItemSelectedImage : String = "CYLTabBarItemSelectedImage"
//let CYLTabBarItemImageInsets  : String = "CYLTabBarItemImageInsets"
//let CYLTabBarItemTitlePositionAdjustment  : String = "CYLTabBarItemTitlePositionAdjustment"
class LFChoseRootControllerManager: NSObject , CYLTabBarControllerDelegate{
    
   class  func choseRootViewController() -> CYLTabBarController {
  
     let home = navigationController(rootContor: LFHomeViewController() )
     let live =  navigationController(rootContor: LFLiveViewController() )
     let follow = navigationController(rootContor: LFFollowViewController() )
     let profile =  navigationController(rootContor: LFProfileViewController() )
    
       let tabBarItemAry = [home,live,follow,profile];
       
        let attributesAry = [[CYLTabBarItemTitle:"首页",CYLTabBarItemImage:"btn_home_normal",CYLTabBarItemSelectedImage:"btn_home_selected"],[CYLTabBarItemTitle:"直播",CYLTabBarItemImage:"btn_column_normal",CYLTabBarItemSelectedImage:"btn_column_selected"],[CYLTabBarItemTitle:"关注",CYLTabBarItemImage:"btn_live_normal",CYLTabBarItemSelectedImage:"btn_live_selected"],[CYLTabBarItemTitle:"我的",CYLTabBarItemImage:"btn_user_normal",CYLTabBarItemSelectedImage:"btn_user_selected"]]
      
          let imageInsets = UIEdgeInsets.zero;
          let titlePositionAdjustment = UIOffset.zero;
        let tBarController  = CYLTabBarController(viewControllers: tabBarItemAry, tabBarItemsAttributes: attributesAry, imageInsets: imageInsets, titlePositionAdjustment: titlePositionAdjustment, context: "")
            tBarController.tabBar.tintColor = UIColor.orange;
            tBarController.tabBar.isTranslucent = false
    ;
        return tBarController
        
    }
    
    
  class  func navigationController(rootContor : UIViewController) -> UINavigationController{
    
    let  navViewController = UINavigationController(rootViewController: rootContor);
        navViewController
        navViewController.navigationBar.isTranslucent = true;
        return  navViewController;
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect control: UIControl) {
        
    }
    
   
   
}
