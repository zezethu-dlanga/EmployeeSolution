//
//  EmployeeRequestModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct EmployeeRequestModel: Codable {
    let userLoginToken: String
    let personalDetails: PersonalDetailsModel
    let additionalInformation: AdditionalInformationModel
}

extension EmployeeRequestModel {
    
    init?(_ viewModel: ReviewDataModel) {
        guard let userLoginToken = viewModel.userLoginToken else {
        return nil
    }
        self.userLoginToken = userLoginToken
        self.personalDetails = PersonalDetailsModel.init(id: viewModel.id ?? 0, email: viewModel.email ?? "", first_name: viewModel.firstName ?? "", last_name: viewModel.lastName ?? "", avatar: viewModel.avatar ?? "", DOB: viewModel.dOB ?? "", gender: viewModel.gender ?? "")
        self.additionalInformation = AdditionalInformationModel.init(placeOfBirth: viewModel.placeOfBirth ?? "", preferredColor: viewModel.colorName ?? "", residentialAddress: viewModel.residentialAddress ?? "")
    }
    
    static func create(viewModel: ReviewDataModel) -> Resource<EmployeeResponseModel?> {
        let employee = EmployeeRequestModel(viewModel)
        
        guard let url = URL(string: Path.updateEmployee.rawValue) else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(employee) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<EmployeeResponseModel?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

