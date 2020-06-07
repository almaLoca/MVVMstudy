//
//  ViewController.swift
//  Mvvmtest
//
//  Created by user on 06/06/20.
//  Copyright © 2020 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,loginData {
    
     var VM =  ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        VM.loginDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnloginAct(_ sender: UIButton) {
        VM.driverLogin(phoneNum: "9526857212", countryCode: "091", password: "12345678")
    }
    func data(userData: User) {
        print(userData.data?.fullName)
    }
}

