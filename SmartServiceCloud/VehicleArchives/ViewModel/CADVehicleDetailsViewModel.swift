//
//  CADVehicleDetailsViewModel.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/26.
//  Copyright © 2018年 车安达. All rights reserved.
//

import UIKit

class CADVehicleDetailsViewModel: NSObject {
    var section2ButtonIndex:Int = 10 // 10 11 12
    var section3ButtonIndex:Int = 13 // 13 14 15
    var data:CADVehicleDetailsModel?
    /**
     *保险信息左边的字典
     */
    static let InformationDic:[String] = ["保险类别","承保公司","购买金额","保单号","保单状态","代理人","代理人电话","附件照片","备注"]
    
    func load_data( success:@escaping (CADVehicleDetailsModel)->() )  {
        guard let dt = CADVehicleDetailsModel(JSON: [:]) else { return }
        data = dt
        success(dt)
    }
    
    
    
    
}
