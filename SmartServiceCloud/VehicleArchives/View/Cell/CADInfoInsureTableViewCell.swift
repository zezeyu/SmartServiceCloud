//
//  CADInfoInsureTableViewCell.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/25.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
fileprivate struct Metric {
    static let height: CGFloat = 177.hr
    static let height2: CGFloat = 177.hr + 14.hr
}
///保险
class CADInfoInsureTableViewCell: UITableViewCell {

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
    
    static func cell2Height() -> CGFloat {
        return Metric.height2
    }
    
}
