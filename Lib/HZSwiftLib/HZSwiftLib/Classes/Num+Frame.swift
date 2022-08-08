//
//  Int+Frame.swift
//  jrw
//
//  Created by cabinzhao on 5/26/17.
//  Copyright © 2017 武汉玖信普惠金融信息服务有限公司. All rights reserved.
//

import UIKit

public extension Int {
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

public extension Double {
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

public extension CGFloat {
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
