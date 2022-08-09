//
//  UIColor+QuickCreateExtension.swift
//  jiurongjk
//
//  Created by cabinzhao on 2/28/17.
//  Copyright © 2017 xuewei. All rights reserved.
//

import UIKit

public extension UIColor {
    
    //根据16进制RGB值快速创建颜色对象
    public convenience init(hex:Int) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0xFF00) >> 8) / 255.0, blue: CGFloat(hex & 0xFF) / 255.0, alpha: 1.0)
    }
    //主色调，蓝色
    static let MainColor = UIColor(hex: 0x36A4F1)
    
    static let VCBackgroundColor = UIColor(hex: 0xf3f3f3)
    
    ///选中tabbar文字颜色
    static let tabSelectedColor = RGB(r: 47.0, g: 166.0, b: 238)
    
    //tabbar文字未选中
    static let tabTextColor = RGB(r: 153, g: 153, b: 153)
    
    //tabbar的颜色
    static let tabColor = UIColor.white
    
    
    ///导航栏颜色
    static let NavColor = UIColor(hex:0x536474)
    
    ///导航栏颜色
    static let LineColor = UIColor(hex:0xDEDFE0)
    
    //505050
    static let black80 = RGB(r: 80, g: 80, b: 80)
    
    //999999
    static let black153 = RGB(r: 153, g: 153, b: 153)
    
    static let black3 = RGB(r: 3, g: 3, b: 3)
    //333333
    static let black51 = RGB(r: 51, g: 51, b: 51)
    /// 180 180 180
    static let black180 = RGB(r: 180, g: 180, b: 180)
    /// 102 102 102
    static let black102 = RGB(r: 102, g: 102, b: 102)
    ///首页按钮颜色
    static let homeColor = RGB(r: 47, g: 166, b: 238)
    ///首页车牌橘色颜色
    static let homeCarNumColor = RGB(r: 241, g: 182, b: 79)
    ///红色字体颜色
    static let commonRed = RGB(r: 223, g: 100, b: 82)
    ///黄色车牌
    static let CarYellowColor = RGB(r: 241, g: 199, b: 58)
    /**车牌号搜索框的底色(灰)*/
    static let CarSearchColor = RGB(r: 241.996, g: 241.996, b: 241.996)
//    /**导航栏进度条颜色*/
//    static let progressColor = hexColor(0x02c602)
//    static let trackColor = hexColor(0xffffff)
    /**人脸识别线圈的颜色*/
    static let faceBorderColor = RGB(r: 5, g: 213, b: 255)
    /**灰204*/
    static let gray204 = RGB(r: 204, g: 204, b: 204)
    /**渐变色开始颜色*/
    static let startColor    = RGB(r: 64, g: 136, b: 246)
    /**渐变色结束颜色*/
    static let endColor      = RGB(r: 23, g: 205, b: 227)
    
}
