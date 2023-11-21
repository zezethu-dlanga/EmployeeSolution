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

enum Gender: String, Codable {
    case Male
    case Female
    case Other
}
