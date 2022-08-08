//
//  CADVehicleArchivesTableViewCell.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/20.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
fileprivate struct Metric {
    static let margin : CGFloat = 8.wr
    static let round : CGFloat = 10.wr
    static let height: CGFloat = 160.hr
}
class CADVehicleArchivesTableViewCell: UITableViewCell,NibLoadable {

    
    @IBOutlet weak var plateNumButton: UIButton!
    
    @IBOutlet weak var bigView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    static func cellHeight() -> CGFloat {
        return Metric.height
    }
    
    
}
