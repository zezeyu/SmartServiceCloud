//
//  UILabel+QuickCreate.swift
//  jiurongjk
//
//  Created by cabinzhao on 2/28/17.
//  Copyright © 2017 xuewei. All rights reserved.
//

import UIKit

extension UILabel {
    
    //根据UILabel属性快速创建对象
    public convenience init(text:String, color:UIColor, fontSize:CGFloat, isBold:Bool) {
        self.init()
        
        self.text = text
        self.textColor = color
        self.font = isBold ? UIFont(name: "Helvetica-Bold", size: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }
    
    public convenience init(text:String, colorHex:Int, fontSize:CGFloat, isBold:Bool) {
        self.init()
        
        self.text = text
        self.textColor = UIColor(hex: colorHex)
        self.font = isBold ? UIFont(name: "Helvetica-Bold", size: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }
    
    public convenience init(text:String, color:UIColor, fontSize:CGFloat, lineSpacing:CGFloat, isBold:Bool) {
        self.init()
        
        self.text = text
        self.textColor = color
        self.font = isBold ? UIFont(name: "Helvetica-Bold", size: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.numberOfLines = 0
        
        let parstyle = NSMutableParagraphStyle()
        parstyle.lineSpacing = lineSpacing
//        let dic = [NSParagraphStyleAttributeName:parstyle]
//        let abStr = NSAttributedString(string: text, attributes: dic)
//        self.attributedText = abStr
    }
    
    public convenience init(color:UIColor, fontSize:CGFloat, isBold:Bool) {
        self.init()        
        self.textColor = color
        self.font = isBold ? UIFont(name: "Helvetica-Bold", size: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.sizeToFit()
    }
    ///带圆角边框的label
    public convenience init(borderColor:UIColor ,fontSize:CGFloat, isBold:Bool){
        self.init()
        self.textAlignment = .center
        self.font = isBold ? UIFont(name: "Helvetica-Bold", size: fontSize) : UIFont.systemFont(ofSize: fontSize)
        self.textColor = borderColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16.wr/2
        self.layer.masksToBounds = true
        self.sizeToFit()
    }
    //显示不同颜色的label
    public convenience init(text:String,attributeColor:UIColor ,range:NSRange,fontSize:CGFloat, isBold:Bool){
        self.init()
        let attributeText = NSMutableAttributedString.init(string: text)
        let count = text.count
//        if isBold {
//             attributeText.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: fontSize)], range: NSMakeRange(0, count))
//        }
//        attributeText.addAttributes([NSForegroundColorAttributeName: attributeColor], range: range)
        self.attributedText = attributeText
    }
}
