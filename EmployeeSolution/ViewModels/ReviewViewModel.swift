//
//  ReviewViewModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/24.
//

import Foundation

struct ReviewDataModel {
    var userLoginToken: String?
    
    var id : Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var fullName: String?
    var avatar: String?
    var dOB: String?
    var gender: String?
    
    var placeOfBirth: String?
    var colorName: String?
    var colorCode: String?
    var residentialAddress: String?
    
    var createdAt: String?
}

class ReviewViewModel {
    private var reviewDataModel = ReviewDataModel()
    
    
    func updateEmployeeDetails(reviewDataModel: ReviewDataModel, completion: @escaping (Bool, ReviewDataModel) -> ()) {
        self.reviewDataModel = reviewDataModel
        Webservice().load(resource: EmployeeRequestModel.create(viewModel: reviewDataModel)) { result in
            switch result {
                case .success(let response):
                    if let response = response {
                        self.reviewDataModel.createdAt = response.createdAt
                        completion(true, self.reviewDataModel)
                    }
                case .failure(let error):
                    print(error)
                    completion(false, self.reviewDataModel)
            }
        }
    }
}
