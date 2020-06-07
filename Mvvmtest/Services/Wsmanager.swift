//
//  Wsmanager.swift
//  Mvvmtest
//
//  Created by user on 06/06/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    static func postMethodWithHeader(URl : String , params : [String : AnyObject] , callback : @escaping((_ Result : AnyObject)-> Void)){
        let defaults = UserDefaults.standard
        let headers = [
            "Auth": "CAR_POOL_AUTH" //orization
        ]
        
        Alamofire.request(APPURL.Domains.Dev + URl, method: .post, parameters: params, encoding: JSONEncoding.default, headers:headers)
            .responseJSON { response in
                
                switch response.response?.statusCode {
                case 200:
                    let JSON = response.result.value
                    callback(JSON as AnyObject)
                default:
                    callback("failed" as AnyObject)
                }
                
        }
        
    }
    
}

