//
//  CADNibLoadable.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/8/16.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit

protocol NibLoadable { }

extension NibLoadable where Self : UIView {
    
    static func loadFromNib(_ nibNmae :String? = nil) -> Self {
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}

