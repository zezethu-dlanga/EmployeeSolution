//
//  ViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Variables
    private var loginAuthViewModel = LoginAuthViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.isSecureTextEntry = true
        }
    }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - Action
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.showSpinner(onView: self.view)

        loginAuthViewModel.login(email: emailTextField.text, password: passwordTextField.text) { result in
            if result {
                self.removeSpinner()
                self.performSegue(withIdentifier: "toEmployeeSegue", sender: self)

            } else {
                self.removeSpinner()
                self.messageLabel.text = "Login details are incorrect, please try again."
            }
        }
    }
}
