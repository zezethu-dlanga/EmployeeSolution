//
//  EmployeeViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class EmployeeViewController: UIViewController, EmployeeDelegate {
    
    //MARK: - Variables
    var employeeDataModel = EmployeeDataModel()
    private var datePicker = UIDatePicker()
    
    
    //MARK: - Outlets
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var placeOfBirthTextField: UITextField!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //Formate Date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        dateOfBirthTextField.addTarget(self, action: #selector(displayPicker), for: .touchDown)
    }
    
    func selectedEmployee(viewModel: EmployeeDataModel) {
        employeeDataModel = viewModel
        emailLabel.text = employeeDataModel.email ?? ""
        fullNameLabel.text = employeeDataModel.fullName
        avatarImageView.image = UIImage(url: URL(string: employeeDataModel.avatar ?? ""))
    }
    
    
    //MARK: - Date of birth Selection
    @objc func displayPicker(textField: UITextField) {
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: false)
        
        dateOfBirthTextField.inputAccessoryView = toolbar
        dateOfBirthTextField.inputView = datePicker
    }

    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateOfBirthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    //MARK: - Action
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        employeeDataModel.dOB = dateOfBirthTextField.text
        employeeDataModel.placeOfBirth = placeOfBirthTextField.text
        
        if Validation.canGoToAdditionalInfoViewController(dataModel: employeeDataModel) {
            self.performSegue(withIdentifier: "toAdditionalInfo", sender: self)
        } else {
            let popup = UIAlertController(title: "", message: "Please ensure you have seleted employee, date of birth, and entered place of birth.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default)
            popup.addAction(ok)
            present(popup, animated: true, completion: nil)
        }
    }
    
    @IBAction func employeeButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toEmployeeList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        employeeDataModel.dOB = dateOfBirthTextField.text
        employeeDataModel.placeOfBirth = placeOfBirthTextField.text

        if segue.identifier == "toAdditionalInfo" {
            if let additionalInfoVC = segue.destination as? AdditionalInfoViewController {
                additionalInfoVC.additionalDataModel.id = employeeDataModel.id
                additionalInfoVC.additionalDataModel.email = employeeDataModel.email
                additionalInfoVC.additionalDataModel.firstName = employeeDataModel.firstName
                additionalInfoVC.additionalDataModel.lastName = employeeDataModel.lastName
                additionalInfoVC.additionalDataModel.fullName = employeeDataModel.fullName
                additionalInfoVC.additionalDataModel.avatar = employeeDataModel.avatar
                additionalInfoVC.additionalDataModel.dOB = employeeDataModel.dOB
                additionalInfoVC.additionalDataModel.placeOfBirth = employeeDataModel.placeOfBirth
            }
        } else {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("NavigationController not fount")
            }
            
            guard let employeeListVC = nav.viewControllers.first as? EmployeeListViewController else {
                fatalError("EmployeeListViewController not fount")
            }
            employeeListVC.employeeDataModel = employeeDataModel
            employeeListVC.delegate = self
        }
    }
}
