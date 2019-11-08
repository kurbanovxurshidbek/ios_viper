//
//  LoginRouting.swift
//  ios_viper
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation

protocol LoginRoutingProtocol {
    func naviagteHomeScreen()
}

class LoginRouting: LoginRoutingProtocol{
    
    weak var viewController: LoginViewController!
    
    func naviagteHomeScreen() {
        viewController.sceneDelegate().callHomeController()
    }
}
