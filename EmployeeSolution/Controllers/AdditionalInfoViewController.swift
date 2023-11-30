//
//  AdditionalInfoViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/22.
//

import Foundation
import UIKit

class AdditionalInfoViewController: UIViewController, ColorDelegate {
  
    //MARK: - Variables
    var additionalDataModel = AdditionalDataModel()
    
    
    //MARK: - Outlets
    @IBOutlet weak var genderUISegmentedControl: UISegmentedControl!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorCodeView: UIView!
 
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        additionalDataModel.gender = genderUISegmentedControl.titleForSegment(at: 0)
    }
    
    func selectedColor(viewModel: AdditionalDataModel) {
        additionalDataModel = viewModel
        colorNameLabel?.text = additionalDataModel.colorName
        colorCodeView.backgroundColor = UIColor(hex: additionalDataModel.colorCode ?? "")
    }
    
    
    //MARK: - Action
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toReview", sender: self)
    }
    
    @IBAction func employeeButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toColorList", sender: self)
    }
    
    @IBAction func genderSegmentedControlIndexChanged(sender : UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            additionalDataModel.gender = sender.titleForSegment(at: 0)
        case 1:
            additionalDataModel.gender = sender.titleForSegment(at: 1)
        case 2:
            additionalDataModel.gender = sender.titleForSegment(at: 2)
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        additionalDataModel.residentialAddress = addressTextField.text
        
        if segue.identifier == "toReview" {
            if let reviewVC = segue.destination as? ReviewViewController {
                reviewVC.reviewDataModel.id = additionalDataModel.id
                reviewVC.reviewDataModel.email = additionalDataModel.email
                reviewVC.reviewDataModel.firstName = additionalDataModel.firstName
                reviewVC.reviewDataModel.lastName = additionalDataModel.lastName
                reviewVC.reviewDataModel.fullName = additionalDataModel.fullName
                reviewVC.reviewDataModel.avatar = additionalDataModel.avatar
                reviewVC.reviewDataModel.dOB = additionalDataModel.dOB
                reviewVC.reviewDataModel.gender = additionalDataModel.gender
                reviewVC.reviewDataModel.placeOfBirth = additionalDataModel.placeOfBirth
                reviewVC.reviewDataModel.colorName = additionalDataModel.colorName
                reviewVC.reviewDataModel.colorCode = additionalDataModel.colorCode
                reviewVC.reviewDataModel.residentialAddress = additionalDataModel.residentialAddress
            }
        } else {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("NavigationController not fount")
            }
            
            guard let colorListVC = nav.viewControllers.first as? ColorListViewController else {
                fatalError("ColorListViewController not fount")
            }
            colorListVC.additionalDataModel = additionalDataModel
            colorListVC.delegate = self
        }
    }
}
