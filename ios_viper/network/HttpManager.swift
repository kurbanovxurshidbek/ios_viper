//
//  HttpManager.swift
//  ios_viper
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation

protocol HttpManagerProtocol {
    func apiLogin(email:String, password: String,completion: @escaping (Result) -> Void)
}

class HttpManager: HttpManagerProtocol {

    func apiLogin(email:String, password: String,completion: @escaping (Result) -> Void){

        AlamHttp.get(url: AlamHttp.API_USER_LOGIN, params: AlamHttp.paramsLogin(email: email, password: password),handler: { response in
            let result = Result()
            switch response.result {
            case .success:
                print(response.result.value)
                let result = try! JSONDecoder().decode(Result.self, from: response.data!)
                completion(result)
            case .failure(let error):
                result.message = error.localizedDescription
                print(error.localizedDescription)
                completion(result)
            }
        })
    }
    
}

