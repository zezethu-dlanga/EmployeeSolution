//
//  EmployeeListResponseModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct EmployeeListResponseModel: Codable{
    let data: [Employee]
}

struct Employee: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
