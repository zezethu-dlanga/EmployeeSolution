//
//  EmployeeResponseModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct EmployeeResponseModel : Codable {
    let userLoginToken: String
    let personalDetails: PersonalDetailsModel
    let additionalInformation: AdditionalInformationModel
    let id: String
    let createdAt: String
}
