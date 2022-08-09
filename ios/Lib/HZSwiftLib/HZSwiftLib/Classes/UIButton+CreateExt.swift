//
//  UIButton+QuickCreateExtension.swift
//  jiurongjk
//
//  Created by cabinzhao on 2/28/17.
//  Copyright © 2017 xuewei. All rights reserved.
//

import UIKit

extension UIButton {
    
    public func setButtonTo(text:String, color:UIColor, fontSize:CGFloat) {
        self.setTitle(text, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }
    
    public convenience init(text:String, color:UIColor, fontSize:CGFloat) {
        self.init()
        self.setButtonTo(text: text, color: color, fontSize: fontSize)
    }
    
    public convenience init(text:String, color:UIColor, fontSize:CGFloat, target:AnyObject?, selector:Selector) {
        self.init()
        self.setButtonTo(text: text, color: color, fontSize: fontSize)
        self.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    public convenience init(imageName:String) {
        self.init()
        self.setImage(UIImage.init(named: imageName), for: .normal)
    }
    
    public convenience init(imageName:String, target:AnyObject?, selector:Selector) {
        self.init()
        self.setImage(UIImage.init(named: imageName), for: .normal)
        self.addTarget(target, action: selector, for: .touchUpInside)
    }
    ///普通状态下的文字
    public func textc(normalText:String){
        self.setTitle(normalText, for: .normal)
    }
    ///普通状态下的颜色
    public func textColorc(normalColor:UIColor){
        self.setTitleColor(normalColor, for: .normal)
    }
    
    public func textLeftAndImageRight(space:CGFloat){
        //文字在左，图片在右
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.imageView?.frame.size.width)!-space, 0.0, (self.imageView?.frame.size.width)!)
        self.imageEdgeInsets = UIEdgeInsetsMake(0, (self.titleLabel?.bounds.size.width)!+space, 0, -(self.titleLabel?.bounds.size.width)!)
    }
    
   
}
