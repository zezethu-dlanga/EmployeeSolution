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
}
