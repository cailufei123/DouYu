//
//  Common.swift
//  DouYu
//
//  Created by cailufei on 2019/7/23.
//  Copyright © 2019 cailufei. All rights reserved.
//
import UIKit

//获取系统版本
let IOS_VERSION = Float(UIDevice.current.systemVersion)
// 大于 iOS 11的系统
let ABOVE_IOS11 = (Float(UIDevice.current.systemVersion) ?? 0.0 >= 11.0) ? true : false
// 小于 iOS 11的系统
let Less_IOS11 = (Float(UIDevice.current.systemVersion) ?? 0.0 < 11.0) ? true : false

//屏幕宽高
let kScreenW : CGFloat = UIScreen.main.bounds.width
let kScreenH : CGFloat = UIScreen.main.bounds.height

//MARK:-机型判断
/** 判断是否是ipad */
let isiPad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
/** 判断是否是iPhone */
let isiPhone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
/** 判断iPhone4 */
let isiPhone4 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 960).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** 判断iPhone5 */
let isiPhone5 =  (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 640, height: 1136).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** 判断iPhone6、iPhone6S、iPhone7、iPhone8系列 */
let isiPhone6 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 750, height: 1334).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** 判断iphone6P系列 */
let isiPhone6P = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2208).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** 判断是否是iPhoneX、iPhoneXS */
let isiPhoneX = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1125, height: 2436).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** iPHoneXR */
let isiPhoneXR = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 828, height: 1792).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** 判断iPhoneXs Max */
let isiPhoneXS_Max = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.main.currentMode)) ? CGSize(width: 1242, height: 2688).equalTo((UIScreen.main.currentMode?.size)!) && !isiPad : false)
/** iPHoneX统一适配 */
let isiPhoneXAll = (kScreenH >= 812.0)

//iPhoneX系列
/** 状态栏高度 */
let kStatusBarH : CGFloat = ((isiPhoneX == true || isiPhoneXR == true || isiPhoneXS_Max == true) ? 44.0 : 20.0)
/** 导航栏高度 */
let kNavgationBarH : CGFloat = ((isiPhoneX == true || isiPhoneXR == true || isiPhoneXS_Max == true) ? 88.0 : 64.0)
/** tabBar高度 */
let kTabBarH : CGFloat = ((isiPhoneX == true || isiPhoneXR == true || isiPhoneXS_Max == true) ? 83.0 : 49.0)
/** home indicator */
let kHomeIndicatorH : CGFloat = ((isiPhoneX == true || isiPhoneXR == true || isiPhoneXS_Max == true) ? 34.0 : 0.0)
