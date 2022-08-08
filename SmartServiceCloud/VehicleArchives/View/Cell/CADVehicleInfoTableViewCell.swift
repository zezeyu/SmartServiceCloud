//
//  CADVehicleInfoTableViewCell.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/25.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
fileprivate struct Metric {
    static let height: CGFloat = 48.hr
}
///车辆信息
class CADVehicleInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var leftLableWidth: NSLayoutConstraint!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func cellHeight() -> CGFloat {
        return Metric.height
    }
}
