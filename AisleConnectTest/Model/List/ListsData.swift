//
//  ListsData.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/8/1.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import Foundation

struct ListsData {
    var id = 0
    var name = ""
    var products = [[String: Any]]()
    
    init(with dic: [String: Any]) {
        if let id = dic["id"] as? Int,
            let name = dic["name"] as? String{
            self.id = id
            self.name = name
        }
        
        if let products = dic["products"] as? [[String: Any]]{
            self.products = products
        }
    }
    
}
