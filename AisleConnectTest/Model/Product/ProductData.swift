//
//  ProductData.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/8/1.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import Foundation

struct ProductData {
    var id = 0
    var name = ""
    var authors = [String]()
    var imageUrl = ""
    
    init(with dic: [String: Any]) {
        if let id = dic["id"] as? Int,
            let name = dic["name"] as? String,
            let imageUrl = dic["imageUrl"] as? String,
            let authors = dic["authors"] as? [String]{
            
            self.id = id
            self.name = name
            self.imageUrl = imageUrl
            self.authors = authors
        }
    }
    
}
