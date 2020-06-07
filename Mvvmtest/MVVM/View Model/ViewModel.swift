//
//  ViewModel.swift
//  Mvvmtest
//
//  Created by user on 06/06/20.
//  Copyright © 2020 user. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol loginData {
    func data(userData: User)
}

class ViewModel {
    var phoneNum,countryCode,password:String!
    var checkPhoneServerError:Bool!
    var DataModel : User!
    var loginDelegate : loginData!
    var fullname :String = String()
    // MARK: -  driver login
    func driverLogin(phoneNum:String,countryCode:String, password : String) {
        var params:[String:String] = [:]
        params["phone"] = phoneNum as String
        params["countryCode"] = countryCode as String
        params["password"] = password as String
        
        self.phoneNum = phoneNum
        self.countryCode = countryCode
        self.password = password
        login()
    }
    
    private func login() {
        DataGenerator.login(phoneNo: phoneNum, countryCode: countryCode,password:password,completionBlock: {(results : AnyObject)-> Void in
            
            self.configureloginDataModel(data: results)
        })
    }
    
    private func configureloginDataModel(data: AnyObject) {
        let json = JSON(data)
        if json == JSON.null {
            checkPhoneServerError = true
        }else {
            checkPhoneServerError = false
            let jsonString = "\(json)"
            let jsonData = jsonString.data(using: .utf8)!
            let result_data = try! JSONDecoder().decode(User.self, from: jsonData)
            DataModel = result_data
            configureLoginData()
        }
    }
   private func configureLoginData() {
        if DataModel.status == "200"{
          loginDelegate.data(userData: DataModel)
        }else {
           print("mkmklmk")
        }
    }
}

