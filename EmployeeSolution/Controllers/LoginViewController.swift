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
        
        //Function for constructing user interface
        setupUI()
    }

    //MARK: - Setup UI
    private func setupUI() {
        //initialising UI elements
        let emailTextField = BindingTextField() //BindingTextField is a custom view that support binding
        let passwordTextField = BindingTextField()
        let loginButton = UIButton()
      
        //Creating emal text field
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .line
        emailTextField.bind { [weak self] text in
            if Validation.isValidEmailAddress(text) {
                loginButton.backgroundColor = UIColor.blue
            } else {
                loginButton.backgroundColor = UIColor.lightGray
            }
            loginButton.isEnabled = Validation.isValidEmailAddress(text)
            
            self?.loginViewModel.email = text
        }
        
        //Creating password text field
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .line
        passwordTextField.layer.borderColor = UIColor.blue.cgColor
        passwordTextField.bind { [weak self] text in
            self?.loginViewModel.password = text
        }
                
        //Creating login button
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = UIColor.lightGray
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        //Control to add elements on the screen
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        //Contrainst to insure the stackView displays on the screen
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
    }
    
    //MARK: - Helper methods
    //Function called when a button is clicked
    @objc func login() {
        print(loginViewModel.email)
        print(loginViewModel.password)
    }
}

