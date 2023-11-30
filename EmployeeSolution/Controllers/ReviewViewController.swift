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
    var reviewDataModel = ReviewDataModel()
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
        avatarImageView.image = UIImage(url: URL(string: reviewDataModel.avatar ?? ""))
        fullNameLabel.text = reviewDataModel.fullName
        emailLabel.text = reviewDataModel.email ?? ""
        dateOfBirthLabel?.text = reviewDataModel.dOB
        genderLabel?.text = reviewDataModel.gender
        colorNameLabel?.text = reviewDataModel.colorName
        placeOfBirthLabel?.text = reviewDataModel.placeOfBirth
        addressLabel?.text = reviewDataModel.residentialAddress
    }
    
    
    //MARK: - Action
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        self.reviewDataModel.userLoginToken = userDefault.getToken()
        self.showSpinner(onView: self.view)
        reviewViewModel.updateEmployeeDetails(reviewDataModel: self.reviewDataModel) { result, vm in
            if result {
                self.removeSpinner()
                self.reviewDataModel = vm
                self.performSegue(withIdentifier: "toSuccessful", sender: self)
            } else {
                self.removeSpinner()
                fatalError("Opps something went wrong")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let successVC = segue.destination as? SuccessfulViewController {
            successVC.successfulDataModel.fullName = reviewDataModel.fullName
            successVC.successfulDataModel.createdAt = reviewDataModel.createdAt
        }
    }
}
