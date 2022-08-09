//
//  UILabel+UseExt.swift
//  jrw
//
//  Created by cabinzhao on 5/22/17.
//  Copyright © 2017 武汉玖信普惠金融信息服务有限公司. All rights reserved.
//

import UIKit
//UILabel设置富文本
extension UILabel {

    public func setStrsColor(strs:[String], color:UIColor) {
        if let oldStr = self.text as NSString? {
            let attriStr = NSMutableAttributedString(string: oldStr as String)
            for str in strs {
                attriStr.addAttributes([NSAttributedStringKey.foregroundColor : color], range: oldStr.range(of: str))
            }
            self.attributedText = attriStr
        }
    }
    
    ///设置富文本
    public func setRich(str:String, fontSize:CGFloat, color:UIColor) {
        if let oldStr = self.text as NSString? {
            let attriStr = NSMutableAttributedString(string: oldStr as String)
            attriStr.addAttributes([NSAttributedStringKey.foregroundColor : color, NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            self.attributedText = attriStr
        }
    }
    ///加粗的富文本
    public func setRichBold(str:String, fontSize:CGFloat, color:UIColor) {
        if let oldStr = self.text as NSString? {
            let attriStr = NSMutableAttributedString(string: oldStr as String)
            attriStr.addAttributes([NSAttributedStringKey.foregroundColor : color, NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            attriStr.addAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            self.attributedText = attriStr
        }
    }
    ///不加粗的富文本
    public func setRichNotBold(str:String, fontSize:CGFloat, color:UIColor) {
        if let oldStr = self.text as NSString? {
            let attriStr = NSMutableAttributedString(string: oldStr as String)
            attriStr.addAttributes([NSAttributedStringKey.foregroundColor : color, NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            attriStr.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            self.attributedText = attriStr
        }
    }
    ///线下打卡的月份：不加粗的富文本,设置字间距
    public func setRichNotBoldWordSpacing(str:String, text:String, fontSize:CGFloat,wordSpacing:CGFloat, color:UIColor) {
        if let oldStr = self.text as NSString? {
            let attriStr = NSMutableAttributedString(string: oldStr as String)
            attriStr.addAttributes([NSAttributedStringKey.foregroundColor : color, NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            attriStr.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            attriStr.addAttributes([NSAttributedStringKey.kern: wordSpacing], range: oldStr.range(of: text))
            self.attributedText = attriStr
        }
    }
    ///设置行间距
    public func setlineSpacing(text:String,lineSpacing:CGFloat){
        self.text = text
        let parstyle = NSMutableParagraphStyle()
        parstyle.lineSpacing = lineSpacing
        let dic = [NSAttributedStringKey.paragraphStyle:parstyle]
        let abStr = NSAttributedString(string: text, attributes: dic)
        self.attributedText = abStr
    }
    ///设置字间距
    public func setWordSpacing(text:String,wordSpacing:CGFloat){
        self.text = text
        let dic = [NSAttributedStringKey.kern:wordSpacing]
        let abStr = NSAttributedString(string: text, attributes: dic)
        self.attributedText = abStr
//        if let oldStr = self.text as NSString? {
//            let attriStr = NSMutableAttributedString(string: oldStr as String)
//            attriStr.addAttributes([NSKernAttributeName: wordSpacing], range: oldStr.range(of: text))
//            self.attributedText = attriStr
//        }
    }
    
    ///同时设置行间距和富文本
    public func setLineSpaceAndRich(str:String, fontSize:CGFloat, color:UIColor, bold:Bool, lineSpacing:CGFloat) {
        if let oldStr = self.text as NSString? {
            let attriStr = NSMutableAttributedString(string: oldStr as String)
            attriStr.addAttributes([NSAttributedStringKey.foregroundColor : color, NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            if bold {
                attriStr.addAttributes([NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            } else {
                attriStr.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: fontSize)], range: oldStr.range(of: str))
            }
            let parstyle = NSMutableParagraphStyle()
            parstyle.lineSpacing = lineSpacing
            attriStr.addAttributes([NSAttributedStringKey.paragraphStyle:parstyle], range: NSRange(location: 0, length: oldStr.length))
            self.attributedText = attriStr
        }
    }
}

