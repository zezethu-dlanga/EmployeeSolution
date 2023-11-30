//
//  PersonalDetailsModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct PersonalDetailsModel: Codable {
    let id : Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    let DOB: String
    let gender: String
}

extension PersonalDetailsModel {
    init?(_ viewModel: ReviewDataModel) {
        guard let userLoginToken = viewModel.userLoginToken else {
        return nil
    }
        self.id = viewModel.id ?? 0
        self.email = viewModel.email ?? ""
        self.first_name =  viewModel.firstName ?? ""
        self.last_name = viewModel.lastName ?? ""
        self.avatar = viewModel.avatar ?? ""
        self.DOB = viewModel.dOB ?? ""
        self.gender = viewModel.gender ?? ""
    }
}
