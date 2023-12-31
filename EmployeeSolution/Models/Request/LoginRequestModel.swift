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
    
    init?(_ viewModel: LoginDataModel) {
        guard let email = viewModel.email,
        let password = viewModel.password else {
        return nil
    }
        self.email = email
        self.password = password
    }
    
    static func create(viewModel: LoginDataModel) -> Resource<LoginResponseModel?> {
        let login = LoginRequestModel(viewModel)
        
        guard let url = URL(string: Path.login.rawValue) else {
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
