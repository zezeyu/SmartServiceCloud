//
//  UIView+FrameExtent.swift
//  jiurongjk
//
//  Created by cabinzhao on 2/28/17.
//  Copyright © 2017 xuewei. All rights reserved.
//

import UIKit

extension UIView {
    
    public var cb_left:CGFloat {
        get {
            return self.frame.origin.x;
        }
        
        set {
            self.frame = CGRect(x: newValue, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    public var cb_top:CGFloat {
        get {
            return self.frame.origin.y;
        }
        
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: newValue, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    //顶部距离父视图底部距离
    public var cb_top_toSuperViewBottom:CGFloat {
        get {
            return (self.superview?.cb_height ?? 0) - (self.frame.origin.y);
        }
    }
    //底部距离父视图底部距离
    public var cb_bottom_toSuperViewBottom:CGFloat {
        get {
            return (self.superview?.cb_height ?? 0) - (self.frame.origin.y + self.frame.size.height);
        }
    }
    
    public var cb_width:CGFloat {
        get {
            return self.frame.size.width;
        }
        
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue, height: self.frame.size.height)
        }
    }
    
    public var cb_height:CGFloat {
        get {
            return self.frame.size.height;
        }
        
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newValue)
        }
    }
    
    public var cb_size:CGSize {
        get {
            return self.frame.size
        }
        
        set {
            var frame = self.frame;
            frame.size = newValue;
            self.frame = frame;
        }
    }
    
    public var cb_centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set {
            var center = self.center;
            center.x = newValue;
            self.center = center;
        }
    }
    
    public var cb_centerY:CGFloat {
        get {
            return self.center.y
        }
        
        set {
            var center = self.center
            center.y = newValue
            self.center = center
        }
    }
    
    
    public var cb_right:CGFloat {
        get {
            return self.cb_left + self.cb_width
        }
        
        set {
            self.cb_left = newValue - self.cb_width
        }
    }
    
    public var cb_bottom:CGFloat {
        get {
            return self.cb_top + self.cb_height
        }
        
        set {
            self.cb_top = newValue - self.cb_height
        }
    }
    
}
