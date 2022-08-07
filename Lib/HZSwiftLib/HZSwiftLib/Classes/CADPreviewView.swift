//
//  CADPreviewView.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/11/14.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
import AVFoundation
import Then
import SnapKit
import HZOCLib
///RGB颜色转换
func RGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}
///全屏宽
let kScreenWidth = UIScreen.main.bounds.width
///全屏高
let kScreenHeight = UIScreen.main.bounds.height
///获取状态栏的高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
///获取导航栏的高度
let kNavBarHeight:CGFloat = 44.0
///获取整个导航栏的高度 （状态栏加导航栏）
let kTopHeight = (kStatusBarHeight + kNavBarHeight)

/**人脸识别线圈的颜色*/
let faceBorderColor = RGB(r: 5, g: 213, b: 255)

fileprivate struct Metric{
    static let faceWidth:CGFloat = (kScreenWidth - 49 * 2).wr
    static let faceline:CGFloat = 1.wr
    static let faceline2:CGFloat = 3.wr
    static let faceline3:CGFloat = 4.wr
    static let margin:CGFloat = 10.0.wr
    static let scanLineMargin:CGFloat = 13.wr
    static let faceline2Width:CGFloat = (Metric.margin * 4 + Metric.faceWidth) + faceline2 * 2
    static let faceline3Width:CGFloat = (Metric.margin * 6 + Metric.faceWidth) + faceline3 * 2
}

@objcMembers public class CADPreviewView: UIView {
    
    fileprivate var faceScanningWindowLayer = CAShapeLayer()
    /// 存放每一张脸的字典[faceID: id]
    fileprivate var faceLayers = [String: Any]()
    lazy var scanLineImageView:UIImageView = UIImageView(image: UIImage.init(contentsOfFile: "qrcode_scan_light_green")).then { make in
        self.addSubview(make)
    }
    lazy var showView0:HZMulticolorView = HZMulticolorView(frame: CGRect(x: 0, y: 0, width: Metric.faceline2Width, height: Metric.faceline2Width))
    lazy var showView1:HZMulticolorView = HZMulticolorView(frame: CGRect(x: 0, y: 0, width: Metric.faceline2Width, height: Metric.faceline2Width))
    lazy var showView2:HZMulticolorView = HZMulticolorView(frame: CGRect(x: 0, y: 0, width: Metric.faceline3Width, height: Metric.faceline3Width))
    
    
    fileprivate var previewLayer = AVCaptureVideoPreviewLayer()
    @objc public var facePathRect:CGRect = CGRect()
    
    @objc public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        scanLineUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kTopHeight)
        setupViews()
        scanLineUI()
    }
    
    fileprivate func setupViews(){
        backgroundColor = UIColor.black
        
        faceScanningWindowLayer.position = self.layer.position
        faceScanningWindowLayer.bounds = CGRect(origin: .zero, size: CGSize(width: Metric.faceWidth, height: Metric.faceWidth))
        faceScanningWindowLayer.cornerRadius = Metric.faceWidth / 2
        faceScanningWindowLayer.borderColor = faceBorderColor.cgColor
        faceScanningWindowLayer.borderWidth = Metric.faceline
        layer.addSublayer(faceScanningWindowLayer)
        
        //最里层镂空
        let transparentRoundedRectPath = UIBezierPath(roundedRect: faceScanningWindowLayer.frame, cornerRadius: faceScanningWindowLayer.cornerRadius)
        // 最外层背景
        let path = UIBezierPath(rect: self.frame)
        path.append(transparentRoundedRectPath)
        path.usesEvenOddFillRule = true
        
        let fillLayer = CAShapeLayer()
        fillLayer.path = path.cgPath
        fillLayer.fillRule = kCAFillRuleEvenOdd
        fillLayer.fillColor = UIColor.black.cgColor
        fillLayer.opacity = 0.6
        layer.addSublayer(fillLayer)
        
        let rect = faceScanningWindowLayer.frame
        facePathRect = rect
        
        let faceScanningWindowLayer1 = CAShapeLayer()
        faceScanningWindowLayer1.position = self.layer.position
        faceScanningWindowLayer1.bounds = CGRect(origin: .zero, size: CGSize(width: Metric.margin * 2 + Metric.faceWidth, height: Metric.margin * 2 + Metric.faceWidth))
        faceScanningWindowLayer1.cornerRadius = (Metric.margin * 2 + Metric.faceWidth) / 2
        faceScanningWindowLayer1.borderColor = faceBorderColor.cgColor
        faceScanningWindowLayer1.borderWidth = Metric.faceline
        layer.addSublayer(faceScanningWindowLayer1)
        
        

        showMultiView(view: showView0, lineWidth:  Metric.faceline2, reverse: false, start: 0, end: 0.25)

        showMultiView(view: showView1, lineWidth:  Metric.faceline2, reverse: false, start: 0.5, end: 0.75)
        
        showMultiView(view: showView2, lineWidth:  Metric.faceline3, reverse: true, start: 0.2, end: 0.85)
        
        
     }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
        
     }
    */
    
}

extension CADPreviewView {
    func scanLineUI(){
        scanLineImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.centerY).offset(-(Metric.faceWidth/2 + 4.wr))
            make.left.equalToSuperview().offset(Metric.scanLineMargin)
            make.right.equalToSuperview().offset(-Metric.scanLineMargin)
//            make.height.equalTo(2.wr)
        }
        let animation = CABasicAnimation(keyPath: "transform.translation.y")
        animation.repeatCount = MAXFLOAT
        animation.duration = 1.2
        animation.autoreverses = true //self.cb_centerY - Metric.faceWidth/2  self.cb_centerY + Metric.faceWidth/2
        animation.toValue     = Metric.faceWidth
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        scanLineImageView.layer.add(animation, forKey: nil)
    }
    
    func showMultiView(view:HZMulticolorView , lineWidth:CGFloat , reverse:Bool , start:CGFloat,end:CGFloat) {
        view.center = self.layer.position
        view.lineWidth = lineWidth
        view.sec = 2.5
        view.isReverse = reverse
        view.colors = [faceBorderColor.cgColor,UIColor.MainColor.cgColor,faceBorderColor.cgColor]
        self.addSubview(view)
        view.startAnimation(start, strokeEnd: end)
    }
    
}

extension CGFloat {
    var wr:CGFloat {
        get {
            return self * Screen.widthRatio
        }
    }
    var hr:CGFloat {
        get {
            return self * Screen.heightRatio
        }
    }
}
extension Int {
    var wr:CGFloat {
        get {
            return CGFloat(self) * Screen.widthRatio
        }
    }
    var hr:CGFloat {
        get {
            return CGFloat(self) * Screen.heightRatio
        }
    }
    var cg:CGFloat {
        get {
            return CGFloat(self)
        }
    }
}
extension Double {
    var wr:CGFloat {
        get {
            return CGFloat(self) * Screen.widthRatio
        }
    }
    var hr:CGFloat {
        get {
            return CGFloat(self) * Screen.heightRatio
        }
    }
    var cg:CGFloat {
        get {
            return CGFloat(self)
        }
    }
}
class Screen {
    
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    
    //UI设计图标准高宽 375 667
    static var UI_WIDTH:CGFloat = 375
    static var UI_HEIGHT:CGFloat = 667
    
    //屏幕适配宽度比例系数
    static let widthRatio:CGFloat = width / UI_WIDTH
    //屏幕适配比例系数 高度
    //minus 为不拉伸部分 0 代表全部拉伸
    //                20 不拉伸状态栏
    //                64 不拉伸状态栏+导航栏
    //               108 不拉伸状态栏+导航栏+Tab
    static var minusOffset:CGFloat = 0
    static var heightRatio:CGFloat {
        get {
            return (height - minusOffset) / (UI_HEIGHT - minusOffset)
        }
    }
    
}
extension UIColor {
    
    //根据16进制RGB值快速创建颜色对象
    public convenience init(hex:Int) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0, green: CGFloat((hex & 0xFF00) >> 8) / 255.0, blue: CGFloat(hex & 0xFF) / 255.0, alpha: 1.0)
    }
    //主色调，蓝色
    static let MainColor = UIColor(hex: 0x36A4F1)
}
