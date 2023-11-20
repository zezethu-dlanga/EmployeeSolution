//
//  ViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Variables
    private var loginViewModel = LoginViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func login() {
        print(loginViewModel.email)
        print(loginViewModel.password)
    }

    //MARK: - Setup UI
    private func setupUI() {
        let emailTextField = BindingTextField()
        let passwordTextField = BindingTextField()
        let loginButton = UIButton()
      
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .line
        emailTextField.bind { [weak self] text in
            if Validation.isValidEmailAddress(text) {
                emailTextField.layer.borderColor = UIColor.blue.cgColor
                loginButton.backgroundColor = UIColor.blue
            } else {
                emailTextField.layer.borderColor = UIColor.red.cgColor
                loginButton.backgroundColor = UIColor.lightGray
            }
            loginButton.isEnabled = Validation.isValidEmailAddress(text)
            
            self?.loginViewModel.email = text
        }
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .line
        passwordTextField.layer.borderColor = UIColor.blue.cgColor
        passwordTextField.bind { [weak self] text in
            self?.loginViewModel.password = text
        }
                
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.lightGray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
}

