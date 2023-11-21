//
//  EmployeeViewModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct EmployeeViewModel {
    var userLoginToken: String?
    
    var id : Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    var dOB: String?
    var gender: [String] {
        return Gender.allCases.map {$0.rawValue.capitalized}
    }
    
    var placeOfBirth: String?
    var preferredColor: String?
    var residentialAddress: String?
}
