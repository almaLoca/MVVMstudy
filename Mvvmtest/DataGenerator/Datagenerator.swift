//
//  Datagenerator.swift
//  Mvvmtest
//
//  Created by user on 06/06/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation

class DataGenerator {
    
    // MARK: - login api call
    static func login(phoneNo:String,countryCode:String,password:String, completionBlock : @escaping ((_ result : AnyObject)-> Void)){
        let url = APPURL.Routes.login
        var params:[String:String] = [:]
        params["phone"] = phoneNo as String
        params["countryCode"] = countryCode as String
        params["password"] = password as String
       
        APIManager.postMethodWithHeader(URl: url, params: params as [String : AnyObject] , callback: {(results : AnyObject)-> Void in
//            print(results)
            completionBlock(results)
        })
    }
}
