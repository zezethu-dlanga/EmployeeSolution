//
//  LoginViewModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/20.
//

import Foundation


struct LoginViewModel {
    var email: String?
    var password: String?
}

class LoginAuthViewModel {
    private var loginViewModel = LoginViewModel()
    private let userDefault = UserDefault.sharedInstance
    
    init() {
        userDefault.defaultEmail()
        userDefault.defaultPass()
    }
    
    func loginAuth(email: String?, password: String?) -> Bool{
        loginViewModel.email = email
        loginViewModel.password = password
        
        if userDefault.getEmail() == loginViewModel.email && userDefault.getPass() == loginViewModel.password {
            return true
        } else {
            return false
        }
    }
    
    func login(email: String?, password: String?, completion: @escaping (Bool) -> ()) {
        if loginAuth(email: email, password: password) {
            Webservice().load(resource: LoginRequestModel.create(viewModel: self.loginViewModel)) { result in
                switch result {
                    case .success(let login):
                        if let login = login {
                            self.saveToken(token: login.token)
                            completion(true)
                        }
                    case .failure(let error):
                        print(error)
                        completion(false)
                }
            }
        } else {
            completion(false)
        }
    }
    
    func saveToken(token: String) {
        self.userDefault.saveToken(value: token)
    }
}
