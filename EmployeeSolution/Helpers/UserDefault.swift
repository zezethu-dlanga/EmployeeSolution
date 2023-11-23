//
//  UserDefault.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/23.
//

import Foundation

class UserDefault {
    static let sharedInstance = UserDefault()
    private let userDefault = UserDefaults.standard
    private let token = "token"
    private let email = "email"
    private let pass = "pass"
    
    func saveToken(value: String) {
        userDefault.set(value.fastestEncoding.rawValue, forKey: token)
    }
    
    func getToken() -> String? {
        return userDefault.string(forKey: token)
    }
    
    func defaultEmail() {
        userDefault.set("eve.holt@reqres.in", forKey: email)
    }
    
    func getEmail() -> String? {
        return userDefault.string(forKey: email)
    }
    
    func defaultPass() {
        userDefault.set("cityslicka", forKey: pass)
    }
    
    func getPass() -> String? {
        return userDefault.string(forKey: pass)
    }
}
