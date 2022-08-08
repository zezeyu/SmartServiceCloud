//
//  CADVehicleDetailsModel.swift
//  cheanda
//
//  Created by 何泽的mac on 2018/12/26.
//  Copyright © 2018年 车安达. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

struct CADVehicleDetailsModel: Mappable {
    
    var section2ButtonIndex:Int = 10 // 10 11 12
    var section3ButtonIndex:Int = 13 // 13 14 15
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
//        section2ButtonIndex <- map["section2ButtonIndex"]
//        section3ButtonIndex <- map["section3ButtonIndex"]
    }
    
    
}
