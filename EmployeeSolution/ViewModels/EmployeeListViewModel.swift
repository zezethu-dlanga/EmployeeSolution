//
//  EmployeeListViewModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

class EmployeeListViewModel {
    var employeeListViewModel: [EmployeeDataViewModel]
    
    init() {
        self.employeeListViewModel = [EmployeeDataViewModel]()
    }
    
    func employeeDataViewModel(at index: Int) -> EmployeeDataViewModel {
        return self.employeeListViewModel[index]
    }
}

struct EmployeeDataViewModel {
    let employee: Employee
    
    var id: Int {
        return self.employee.id
    }
    
    var firstName: String {
        return self.employee.first_name
    }
    
    var lastName: String {
        return self.employee.last_name
    }
    
    var fullName: String {
        return "\(self.employee.first_name) \(self.employee.last_name)"
    }
    
    var email: String {
        return self.employee.email
    }
    
    var avatar: String {
        return self.employee.avatar
    }
}
