//
//  AlamHttp.swift
//  ios_viper
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation
import Alamofire

private let IS_TESTER = true

private let DEPLOYMENT_SERVER = "http://locahost:8080/"
private let DEVELOPMENT_SERVER = "http://locahost:8080/"
private let CONTENT_TYPE = "application/json"

class AlamHttp {
    
    // MARK : - AlamHttp Requests
    
    class func get(url:String,params: Parameters,handler: @escaping (DataResponse<Any>) -> Void){
        Alamofire.request(getServer(url: url), method: .get, parameters: params).validate(contentType: [CONTENT_TYPE]).responseJSON(completionHandler: handler)
    }
    
    class func post(url:String,params: Parameters,handler: @escaping (DataResponse<Any>) -> Void){
        Alamofire.request(getServer(url: url), method: .post, parameters: params).validate(contentType: [CONTENT_TYPE]).responseJSON(completionHandler: handler)
    }
    
    // MARK : - AlamHttp Methods
    
    class func getServer(url:String) -> URL {
        if(IS_TESTER){
            return URL(string:DEVELOPMENT_SERVER + url)!
        }
        return URL(string:DEPLOYMENT_SERVER + url)!
    }
    
    // MARK : - AlamHttp Apis
    
    static let API_USER_LOGIN = "api/login"
    
    // MARK : - AlamHttp Params
    
    class func paramsLogin(email:String,password:String) -> Parameters {

        let parameters: Parameters = [
            "email": email,
            "password": password,
        ]
        print(parameters)
        return parameters
    }
}
