//
//  Model.swift
//  Mvvmtest
//
//  Created by user on 06/06/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
struct User:Codable {
    
    let status:String?
    let data:datas?
    let message:String?
    
}
struct datas:Codable{
    
    let authToken:String?
    let fullName:String?
    let countryCode:String?
    let phoneNo:String?
    let email:String?
    let userId:String?
    let gender:Int?
    let fcmToken: String?
    
}
