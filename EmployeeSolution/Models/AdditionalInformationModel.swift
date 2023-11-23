//
//  AdditionalInformationModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct AdditionalInformationModel: Codable {
    let placeOfBirth: String
    let preferredColor: String
    let residentialAddress: String
}

extension AdditionalInformationModel {
    init?(_ viewModel: EmployeeViewModel) {
        guard let userLoginToken = viewModel.userLoginToken else {
        return nil
    }
        self.placeOfBirth = viewModel.placeOfBirth ?? ""
        self.preferredColor =  viewModel.colorName ?? ""
        self.residentialAddress = viewModel.residentialAddress ?? ""
    }
}
