//
//  LoginPresenter.swift
//  ios_viper
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol: LoginRequestProtocol {
    // To Interactor
    func apiLogin(email:String, password: String)
    // To Routing
    func naviagteHomeScreen()
}

class LoginPresenter: LoginPresenterProtocol{
    
    var ineractor: LoginInteractorProtocol!
    var routing: LoginRoutingProtocol!
    
    func apiLogin(email: String, password: String) {
        ineractor.apiLogin(email: email, password: password)
    }
    
    func naviagteHomeScreen() {
        routing.naviagteHomeScreen()
    }
}
