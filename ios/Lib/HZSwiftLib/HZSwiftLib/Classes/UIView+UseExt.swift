//
//  common.swift
//  appdemo
//
//  Created by xuewei on 16/10/26.
//  Copyright © 2016年 xuewei. All rights reserved.
//

import UIKit

public enum CBLine{
    case CBLineTop
    case CBLineBottom
    case CBLineLeft
    case CBLineRight
}

public enum CBViewLayout{
    case CBViewTop
    case CBViewBottom
    case CBViewCenter
}

public extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth : CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor : UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    //MARK: -添加点击事件
    public func addTapGesture(target:Any, selector:Selector) {
        self.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: target, action: selector)
        self.addGestureRecognizer(singleTap)
    }
    
    public func addButtonClick(extendX:CGFloat, extendY:CGFloat, target:Any, selector:Selector) -> UIButton {
        let btnClick = UIButton()
        btnClick.cb_width = self.cb_width + 2 * extendX
        btnClick.cb_height = self.cb_height + 2 * extendY
        btnClick.cb_centerX = self.cb_centerX
        btnClick.cb_centerY = self.cb_centerY
        btnClick.addTarget(target, action: selector, for: .touchUpInside)
        self.superview?.addSubview(btnClick)
        return btnClick
    }
    
    //修改垂直布局
    private func chVLayout(vw:UIView, viewLayout:CBViewLayout, originValue:CGFloat) {
        switch viewLayout {
        case .CBViewBottom:
            vw.cb_bottom = self.cb_height - originValue
            break
        case .CBViewTop:
            vw.cb_top = originValue
            break
        case .CBViewCenter:
            vw.cb_centerY = self.cb_height * 0.5
            break
        }
    }
    
    //改变横向索引游标
    private func chHorizonSpace(sub:Any, curSpace:CGFloat, isLeft:Bool) -> CGFloat {
        var cur:CGFloat = curSpace
        if let space = sub as? CGFloat {
            cur = isLeft ? cur + space.wr : cur - space.wr
        } else if let space = sub as? Double {
            cur = isLeft ? cur + CGFloat(space).wr : cur - CGFloat(space).wr
        } else if let space = sub as? Int {
            cur = isLeft ? cur + CGFloat(space).wr : cur - CGFloat(space).wr
        }
        return cur
    }
    
    private func chVerticalSpace(sub:Any, curSpace:CGFloat, isTop:Bool) -> CGFloat {
        var cur:CGFloat = curSpace
        if let space = sub as? CGFloat {
            cur = isTop ? cur + space.wr : cur - space.wr
        } else if let space = sub as? Double {
            cur = isTop ? cur + CGFloat(space).wr : cur - CGFloat(space).wr
        } else if let space = sub as? Int {
            cur = isTop ? cur + CGFloat(space).wr : cur - CGFloat(space).wr
        }
        return cur
    }
    
    //左布局
    private func flushSubviewToLeft(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat, isAddView:Bool) {
        var curLeft:CGFloat = 0
        var lastVw:UIView = UIView()
        var ct = 0
        for sub in arrSub {
            if sub is UIView {
                if let vw = sub as? UIView {
                    vw.cb_left = curLeft
                    curLeft += vw.cb_width
                    if ct == 0 {
                        chVLayout(vw: vw, viewLayout: viewLayout, originValue: originValue)
                    } else {
                        vw.cb_centerY = lastVw.cb_centerY
                    }
                    ct += 1
                    lastVw = vw
                    if isAddView {
                        self.addSubview(vw)
                    }
                }
            } else {
                curLeft = chHorizonSpace(sub: sub, curSpace: curLeft, isLeft: true)
            }
        }
    }
    
    public func addSubviewToLeft(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat) {
        self.flushSubviewToLeft(arrSub: arrSub, viewLayout: viewLayout, originValue: originValue, isAddView: true)
    }
    
    //右布局
    private func flushSubviewToRight(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat, isAddView:Bool) {
        var curRight:CGFloat = self.cb_width
        var lastVw:UIView = UIView()
        var ct = 0
        //反向遍历
        for sub in arrSub.reversed() {
            if sub is UIView {
                if let vw = sub as? UIView {
                    vw.cb_right = curRight
                    curRight -= vw.cb_width
                    if ct == 0 {
                        chVLayout(vw: vw, viewLayout: viewLayout, originValue: originValue)
                    } else {
                        vw.cb_centerY = lastVw.cb_centerY
                    }
                    ct += 1
                    lastVw = vw
                    if isAddView {
                        self.addSubview(vw)
                    }
                }
            } else {
                curRight = chHorizonSpace(sub: sub, curSpace: curRight, isLeft: false)
            }
        }
    }
    
    public func addSubviewToRight(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat) {
        self.flushSubviewToRight(arrSub: arrSub, viewLayout: viewLayout, originValue: originValue, isAddView: true)
    }
    
    //居中布局
    private func flushSubviewToCenter(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat, isAddView:Bool) {
        var wd:CGFloat = 0
        for sub in arrSub {
            if sub is UIView {
                if let vw = sub as? UIView {
                    wd += vw.cb_width
                }
            } else {
                wd = chHorizonSpace(sub: sub, curSpace: wd, isLeft: true)
            }
        }
        
        var curLeft = (self.cb_width - wd) * 0.5
        var lastVw:UIView = UIView()
        var ct = 0
        for sub in arrSub {
            if sub is UIView {
                if let vw = sub as? UIView {
                    vw.cb_left = curLeft
                    curLeft += vw.cb_width
                    if ct == 0 {
                        chVLayout(vw: vw, viewLayout: viewLayout, originValue: originValue)
                    } else {
                        vw.cb_centerY = lastVw.cb_centerY
                    }
                    ct += 1
                    lastVw = vw
                    if isAddView {
                        self.addSubview(vw)
                    }
                }
            } else {
                curLeft = chHorizonSpace(sub: sub, curSpace: curLeft, isLeft: true)
            }
        }
    }
    
    public func addSubviewToCenter(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat) {
        self.flushSubviewToCenter(arrSub: arrSub, viewLayout: viewLayout, originValue: originValue, isAddView: true)
    }
    
    //CB布局，更为强大，利用字符串分割
    private func cb_controlSubView(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat, isAddView:Bool) {
        var arrNewSubs = [Any]()
        var lastSubs = [Any]()
        var spCount = 0
        //根据字符串切分数组
        for (index, sub) in arrSub.enumerated() {
            if sub is String { //若遇到字符串，则分割
                if index != 0 {
                    arrNewSubs.append(lastSubs)
                }
                arrNewSubs.append(sub)
                lastSubs = [Any]()
                spCount += 1
            } else {
                lastSubs.append(sub)
                if index == arrSub.count - 1 {
                    arrNewSubs.append(lastSubs)
                }
            }
        }
        
        if spCount == 0 {
            //没有分隔符的情况，则必然是左布局
            self.addSubviewToLeft(arrSub: arrSub, viewLayout: viewLayout, originValue: originValue)
        } else if spCount == 1 {
            //只有一个分隔符的情况有两种：右布局，（左右布局）
            if arrNewSubs[0] is String {
                //分隔符在第一个，则必然是右布局
                self.flushSubviewToRight(arrSub: arrNewSubs[1] as! [Any], viewLayout: viewLayout, originValue: originValue, isAddView: isAddView)
            } else if arrNewSubs[1] is String   { //分隔符在中间 必然（左右布局）
                self.flushSubviewToLeft(arrSub: arrNewSubs[0] as! [Any], viewLayout: viewLayout, originValue: originValue, isAddView: isAddView)
                if let arrTemp = arrNewSubs[2] as? [Any] {
                    self.flushSubviewToRight(arrSub: arrTemp, viewLayout: viewLayout, originValue: originValue, isAddView: isAddView)
                }
            }
        } else if spCount == 2 {
            //被分割包围中心数组索引
            var centerIndex = 0
            for (iin, ttSub) in arrNewSubs.enumerated() {
                if ttSub is String {
                    centerIndex += 1
                    if centerIndex == 2 {
                        centerIndex = iin - 1
                        break
                    }
                }
            }
            if let centerArr = arrNewSubs[centerIndex] as? [Any] {
                self.flushSubviewToCenter(arrSub: centerArr, viewLayout: viewLayout, originValue: originValue, isAddView: isAddView)
            }
            if (centerIndex - 2 >= 0) && (centerIndex - 2 < arrNewSubs.count){
                if let leftArr = arrNewSubs[centerIndex - 2] as? [Any] {
                    self.flushSubviewToLeft(arrSub: leftArr, viewLayout: viewLayout, originValue: originValue, isAddView: isAddView)
                }
            }
            if (centerIndex + 2 >= 0) && (centerIndex + 2 < arrNewSubs.count) {
                if let rightArr = arrNewSubs[centerIndex + 2] as? [Any] {
                    self.flushSubviewToRight(arrSub: rightArr, viewLayout: viewLayout, originValue: originValue, isAddView: isAddView)
                }
            }
        }
    }
    
    public func cb_addSubView(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat) {
        cb_controlSubView(arrSub: arrSub, viewLayout: viewLayout, originValue: originValue, isAddView: true)
    }
    
    public func cb_flushSubView(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat) {
        cb_controlSubView(arrSub: arrSub, viewLayout: viewLayout, originValue: originValue, isAddView: false)
    }
    
    public func cb_addVerticalSubView(arrSub:[Any], viewLayout:CBViewLayout, originValue:CGFloat) {
        var curY = originValue
        if viewLayout == .CBViewTop {
            for sub in arrSub {
                if sub is UIView {
                    if let vw = sub as? UIView {
                        vw.cb_top = curY
                        curY = vw.cb_bottom
                        self.addSubview(vw)
                    }
                } else {
                    curY = chVerticalSpace(sub: sub, curSpace: curY, isTop: true)
                }
            }
        }
    }
    
    //MARK: -添加分割线
    public func addLine(position:CBLine, width:CGFloat,leftMargin:CGFloat = 0) {
        _ = self.createLine(position: position, width: width,leftMargin : leftMargin)
    }
    
    public func addLine(position:CBLine,leftMargin:CGFloat = 0) {
        _ = self.createLine(position: position,leftMargin:leftMargin)
    }
    
    public func createLine(position:CBLine,leftMargin:CGFloat = 0) -> UIView {
        let vwSperator = UIView()
        vwSperator.backgroundColor = UIColor(hex: 0xd6d7dc)
        
        switch position {
        case .CBLineTop:
            vwSperator.cb_height = 0.5
            vwSperator.cb_width = Screen.width
            vwSperator.cb_left = leftMargin
            vwSperator.cb_top = 0
        case .CBLineBottom:
            vwSperator.cb_height = 0.5
            vwSperator.cb_width = Screen.width
            vwSperator.cb_left = leftMargin
            vwSperator.cb_bottom = self.cb_height - vwSperator.cb_height
        case .CBLineLeft:
            vwSperator.cb_height = self.cb_height
            vwSperator.cb_width = 0.5
            vwSperator.cb_left = leftMargin
            vwSperator.cb_top = 0
        case .CBLineRight:
            vwSperator.cb_height = self.cb_height
            vwSperator.cb_width = 0.5
            vwSperator.cb_right = self.cb_right
            vwSperator.cb_top = 0
        }
        
        self.addSubview(vwSperator)
        return vwSperator
    }
    
    public func createLine(position:CBLine, width:CGFloat ,leftMargin:CGFloat = 0) -> UIView  {
        let vwSperator = UIView()
        vwSperator.backgroundColor = UIColor(hex: 0xd6d7dc)
        
        vwSperator.cb_height = 0.5
        vwSperator.cb_width = width
        vwSperator.cb_left = leftMargin
        
        switch position {
        case .CBLineTop:
            vwSperator.cb_top = 0
        case .CBLineBottom:
            vwSperator.cb_bottom = self.cb_height - 0.5
        default:
            break
        }
        self.addSubview(vwSperator)
        return vwSperator
    }
    
    public func addLine(position:CBLine, width:CGFloat, value:CGFloat) {
        _ = self.createLine(position: position, width: width, value: value)
    }
    
    public func addLine(position:CBLine, value:CGFloat) {
        _ = self.createLine(position: position, width: Screen.width, value: value)
    }
    
    public func createLine(position:CBLine, width:CGFloat, value:CGFloat) -> UIView {
        let vwSperator = UIView()
        vwSperator.backgroundColor = UIColor(hex: 0xd6d7dc)
        vwSperator.cb_height = 0.5
        vwSperator.cb_width = width
        vwSperator.cb_left = 0
        switch position {
        case .CBLineTop:
            vwSperator.cb_top = value
        case .CBLineBottom:
            vwSperator.cb_bottom = self.cb_height - value
        default: break
        }
        self.addSubview(vwSperator)
        return vwSperator
    }
    
    
    public convenience init(size:CGSize) {
        self.init()
        self.cb_size = size
    }
    ///从业人员管理详情的cell颜色渐变
    public func employeeManageDetailsShowAsInverse(height:CGFloat) {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: kScreenWidth - 24.wr, height: height)
        layer.colors = [RGB(r: 64, g: 136, b: 246).cgColor,RGB(r: 23, g: 205, b: 227).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1.0, y: 0)
        self.layer.addSublayer(layer)
    }
    ///车辆管理详情页头部view颜色渐变
    public func carManageDetailsShowAsInverse(height:CGFloat) {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)
        layer.colors = [RGB(r: 64, g: 136, b: 246).cgColor,RGB(r: 23, g: 205, b: 227).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1.0, y: 0)
        self.layer.addSublayer(layer)
    }
    
    public func addBorderLabel(borderColor:UIColor,fontSize:CGFloat,array:[String]){
//        let array:[String] = ["企业人","驾驶员","押运员","何泽"]
//        for (index, text) in array.enumerated() {
//            let type_label:UILabel = UILabel(borderColor: borderColor ,fontSize: fontSize , isBold:false)
//            type_label.text = text
//            self.addSubview(type_label)
//            let text_Width:CGFloat = type_label.mj_textWith() + 15
//            type_label.snp.makeConstraints { (make) in
////                make.bottom.equalTo(self.icon_imageView.snp.bottom)
//                //前一个元素的长度
//                var str:String = ""
//                if index > 0 {
//                    for i in 0...index{
//                        str = str + array[i]
//                    }
//                    print(str)
////                    make.left.equalTo(self.icon_imageView.snp.right).offset(12 + (str.ga_widthForComment(fontSize: 12.wr) - text_Width + 15) + CGFloat(15 * index) + CGFloat(6 * index).wr)
//                }else{
////                    make.left.equalTo(self.icon_imageView.snp.right).offset(12.wr)
//                }
//                make.width.equalTo(text_Width.wr)
//                make.height.equalTo(16.wr)
//            }
//        }
    }
    
    // MARK:- 裁剪圆角
    func clipCorner(direction: UIRectCorner, radius: CGFloat) {
//
//        let cornerSize = CGSize(width: radius, height: radius)
//        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = bounds
//        maskLayer.path = maskPath.cgPath
//        layer.addSublayer(maskLayer)
//        layer.mask = maskLayer
    }
    
    
}
