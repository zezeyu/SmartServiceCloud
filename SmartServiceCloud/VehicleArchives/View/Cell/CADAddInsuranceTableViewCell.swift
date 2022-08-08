//
//  CADAddInsuranceTableViewCell.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/25.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit
import HZOCLib
fileprivate struct Metric {
    static let height: CGFloat = 178.hr
}
///添加保险信息
class CADAddInsuranceTableViewCell: UITableViewCell {
///点击添加
    @IBOutlet weak var addButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        addButton.hz_setGradientBackground(with: [.startColor,.endColor])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func cellHeight() -> CGFloat {
        return Metric.height
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
//        UIViewController.current()?.navigationController?.pushViewController(CADAddInsuranceViewController(), animated: true)
    }
    
    
}
