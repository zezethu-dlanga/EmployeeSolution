//
//  ViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    //MARK: - Variables
    private var loginViewModel = LoginViewModel()
    private let userDefault = UserDefault.sharedInstance
    private let emailTextField = BindingTextField()
    private let passwordTextField = BindingTextField()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefault.defaultEmail()
        userDefault.defaultPass()
        //Function for constructing user interface
        setupUI()
    }

    //MARK: - Setup UI
    private func setupUI() {
        
        //Creating emal text field
        emailTextField.placeholder = "Enter email"
        emailTextField.borderStyle = .line
        emailTextField.bind { [weak self] text in
            if Validation.isValidEmailAddress(text) {
                self?.loginButton.titleLabel?.textColor = UIColor.black
            } else {
                self?.loginButton.titleLabel?.textColor = UIColor.lightGray
            }
            //self?.loginButton.isEnabled = Validation.isValidEmailAddress(text)
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
        
        //Control to add elements on the screen
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, messageLabel, loginButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        self.view.addSubview(stackView)
        
        //Contrainst to insure the stackView displays on the screen
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    
    //MARK: - Action
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toEmployeeSegue", sender: self)
        
//        if userDefault.getEmail() == loginViewModel.email?.lowercased() && userDefault.getPass() == loginViewModel.password {
//            Webservice().load(resource: LoginRequestModel.create(viewModel: self.loginViewModel)) { result in
//                switch result {
//                    case .success(let login):
//                        if let login = login {
//                            self.userDefault.saveToken(value: login.token)
//                            self.performSegue(withIdentifier: "toEmployeeSegue", sender: self)
//                        }
//                    case .failure(let error):
//                        print(error)                }
//            }
//        } else {
//            messageLabel.text = "Details you have entered are incorrect, please try again."
//        }
    }
}
