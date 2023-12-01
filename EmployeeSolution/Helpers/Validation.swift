//
//  Validation.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/20.
//

import Foundation

class Validation {
    class func isValidEmailAddress(_ email: String?) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func canLogin(_ email: String, _ password: String) -> Bool {
        if isValidEmailAddress(email) {
            if password.isEmpty {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
    
    class func canGoToAdditionalInfoViewController(dataModel: EmployeeDataModel) -> Bool {
        print(dataModel.placeOfBirth?.isEmpty)
        print(dataModel.fullName?.isEmpty)
        
        if dataModel.id != nil &&
            dataModel.firstName?.isEmpty == false &&
            dataModel.lastName?.isEmpty == false &&
            dataModel.fullName?.isEmpty == false &&
            dataModel.email?.isEmpty == false &&
            dataModel.dOB?.isEmpty == false &&
            dataModel.placeOfBirth?.isEmpty == false &&
            dataModel.avatar?.isEmpty == false {
            return true
        } else {
            return false
        }
    }
    
    class func canGoToReviewViewController(dataModel: AdditionalDataModel) -> Bool {
        if dataModel.gender?.isEmpty == false &&
            dataModel.colorName?.isEmpty == false &&
            dataModel.colorCode?.isEmpty == false &&
            dataModel.residentialAddress?.isEmpty == false {
            return true
        } else {
            return false
        }
    }
}
