//
//  JsonData.swift
//  MondayTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import Foundation

struct LoginData {
    var access_token: String?
    var token_type: String?
    var refresh_token: String?
    var expires_in: Int?
    var scope: String?
    
    var error: String?
    var error_description: String?
    
    init(with dic: [String: Any]) {
        if let access_token = dic["access_token"] as? String,
            let token_type = dic["token_type"] as? String,
            let refresh_token = dic["refresh_token"] as? String,
            let expires_in = dic["expires_in"] as? Int,
            let scope = dic["scope"] as? String{
            
            self.access_token = access_token
            self.token_type = token_type
            self.refresh_token = refresh_token
            self.expires_in = expires_in
            self.scope = scope
        }
        
        if let error = dic["error"] as? String,
            let error_description = dic["error_description"] as? String{
            
            self.error = error
            self.error_description = error_description
        }
    }
    
}
