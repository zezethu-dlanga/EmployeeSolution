//
//  ReviewViewModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/24.
//

import Foundation

class ReviewViewModel {
    private var employeeViewModel = EmployeeViewModel()
    
    
    func updateEmployeeDetails(employeeViewModel: EmployeeViewModel, completion: @escaping (Bool, EmployeeViewModel) -> ()) {
        self.employeeViewModel = employeeViewModel
        Webservice().load(resource: EmployeeRequestModel.create(viewModel: employeeViewModel)) { result in
            switch result {
                case .success(let response):
                    if let response = response {
                        self.employeeViewModel.createdAt = response.createdAt
                        completion(true, self.employeeViewModel)
                    }
                case .failure(let error):
                    print(error)
                    completion(false, self.employeeViewModel)
            }
        }
    }
}
