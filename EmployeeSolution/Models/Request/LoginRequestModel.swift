//
//  LoginRequestModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct LoginRequestModel: Codable {
    let email: String
    let password: String
}

extension LoginRequestModel {
    
    init?(_ viewModel: LoginViewModel) {
        guard let email = viewModel.email,
        let password = viewModel.password else {
        return nil
    }
        self.email = email
        self.password = password
    }
    
    static func create(viewModel: LoginViewModel) -> Resource<LoginResponseModel?> {
        let login = LoginRequestModel(viewModel)
        
        guard let url = URL(string: "https://reqres.in/api/login") else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(login) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<LoginResponseModel?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}
