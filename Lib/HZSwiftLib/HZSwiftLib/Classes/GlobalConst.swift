//
//  GlobalConst.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/4/1.
//  Copyright © 2018年 车安达. All rights reserved.
//

//////////全局常量 ---> 就是OC的宏定义一样

import Foundation
import UIKit

///4s和5s 宽
let kiOS4S_5S:CGFloat = 320.0
///6s和7宽
let kiOS6S:CGFloat = 375.0
///iOS6plus宽
let kiOS6Plus:CGFloat = 414.0
///系统当前系统版本
func IS_IOS() -> Double {
    
    return Double(UIDevice.current.systemVersion as String)!
}
///网络请求超时时间
let networkTimeOut:TimeInterval = 30

///RGB颜色转换
public func RGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}
///全屏宽
public let kScreenWidth = UIScreen.main.bounds.width
///全屏高
public let kScreenHeight = UIScreen.main.bounds.height
///获取状态栏的高度
public let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
///获取导航栏的高度
public let kNavBarHeight:CGFloat = 44.0
///获取整个导航栏的高度 （状态栏加导航栏）
public let kTopHeight = (kStatusBarHeight + kNavBarHeight)

public func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
