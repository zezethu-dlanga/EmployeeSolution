//
//  ReviewViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/22.
//

import Foundation
import UIKit

class ReviewViewController: UIViewController {
    
    //MARK: - Variables
    var reviewViewModel = ReviewViewModel()
    var employeeViewModel = EmployeeViewModel()
    private let userDefault = UserDefault.sharedInstance
    
    
    //MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        setupUI()
    }
    
    
    //MARK: - Setup UI
    private func setupUI() {
        avatarImageView.image = UIImage(url: URL(string: employeeViewModel.avatar ?? ""))
        fullNameLabel.text = employeeViewModel.fullName
        emailLabel.text = employeeViewModel.email ?? ""
        dateOfBirthLabel?.text = employeeViewModel.dOB
        genderLabel?.text = employeeViewModel.gender
        colorNameLabel?.text = employeeViewModel.colorName
        placeOfBirthLabel?.text = employeeViewModel.placeOfBirth
        addressLabel?.text = employeeViewModel.residentialAddress
    }
    
    
    //MARK: - Action
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        self.employeeViewModel.userLoginToken = userDefault.getToken()
        self.showSpinner(onView: self.view)
        reviewViewModel.updateEmployeeDetails(employeeViewModel: self.employeeViewModel) { result, vm in
            if result {
                self.removeSpinner()
                self.employeeViewModel = vm
                self.performSegue(withIdentifier: "toSuccessful", sender: self)
            } else {
                self.removeSpinner()
                fatalError("Opps something went wrong")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let successVC = segue.destination as? SuccessfulViewController {
            successVC.employeeViewModel = employeeViewModel
        }
    }
}
