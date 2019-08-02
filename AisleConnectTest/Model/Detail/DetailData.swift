//
//  DetailData.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/8/1.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import Foundation

struct DetailData {
    var description = ""
    var imageUrl = ""
    
    init(with dic: [String: Any]) {
        if let data = dic["data"] as? [String: Any]{
            
            if let description = data["description"] as? String{
                self.description = description
            }
            
            if let imageUrl = data["imageUrl"] as? String{
                self.imageUrl = imageUrl
            }
        }
    }
    
}
