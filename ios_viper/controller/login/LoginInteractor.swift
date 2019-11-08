//
//  LoginInteractor.swift
//  ios_viper
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation

protocol LoginInteractorProtocol{
    func apiLogin(email:String, password: String)
}

class LoginInteractor: LoginInteractorProtocol{
    
    var manager: HttpManagerProtocol!
    var response: LoginResponseProtocol!
    
    func apiLogin(email: String, password: String) {
        manager.apiLogin(email: email, password: password, completion: {(result) in
            self.response.responseLogin(result: result)
        })
    }
}
