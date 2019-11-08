//
//  LoginViewController.swift
//  ios_viper
//
//  Created by KHURSHIDBEK on 2019/11/06.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import UIKit

protocol LoginRequestProtocol {
    func apiLogin(email:String, password: String)
    
    func naviagteHomeScreen()
}

protocol LoginResponseProtocol {
    func responseLogin(result:Result)
}

class LoginViewController: BaseViewController, LoginResponseProtocol {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    var presenter: LoginRequestProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    // MARK: - Action
    
    @IBAction func loginAction(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        presenter.apiLogin(email: email, password: password)
    }
    
    // MARK: - Method
    
    func initViews(){
        title = "Login"
        configureViper()
    }
    
    func configureViper(){
        let manager = HttpManager()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let routing = LoginRouting()
        
        self.presenter = presenter
        presenter.ineractor = interactor
        presenter.routing = routing
        routing.viewController = self
        interactor.manager = manager
        interactor.response = self
    }
    
    // MARK: - Response
    
    func responseLogin(result: Result) {
        if(result.status == "0"){
            presenter.naviagteHomeScreen()
        }else{
            errorLabel.text = result.message
        }
    }
    
    
}
