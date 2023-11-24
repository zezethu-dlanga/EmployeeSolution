//
//  LoginViewModelTests.swift
//  EmployeeSolutionTests
//
//  Created by Zezethu Dlanga on 2023/11/23.
//

import XCTest
@testable import EmployeeSolution

final class LoginViewModelTests: XCTestCase {

    private var loginViewModel: LoginAuthViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.loginViewModel = LoginAuthViewModel()
    }
    
    func test_should_be_able_to_save_token() {
        self.loginViewModel.saveToken(token: "abc123")
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "token"))
    }
    
    func test_should_return_true_for_correct_login_details() {
        let resultTest = self.loginViewModel.loginAuth(email: "eve.holt@reqres.in", password: "cityslicka")
        XCTAssertEqual(resultTest, true)
    }
    
    func test_should_return_true_for_incorrect_login_details() {
        let resultTest = self.loginViewModel.loginAuth(email: "test", password: "test")
        XCTAssertNotEqual(resultTest, true)
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "token")
    }

}
