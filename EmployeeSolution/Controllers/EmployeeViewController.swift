//
//  EmployeeViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class EmployeeViewController: UIViewController, EmployeeDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var placeOfBirthTextField: UITextField!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    //MARK: - Variables
    private var employeeViewModel = EmployeeViewModel()
    private var datePicker = UIDatePicker()
    
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
    
    func selectedEmployee(viewModel: EmployeeViewModel) {
        employeeViewModel = viewModel
        emailLabel.text = employeeViewModel.email ?? ""
        fullNameLabel.text = employeeViewModel.fullName
        avatarImageView.image = UIImage(url: URL(string: employeeViewModel.avatar ?? ""))
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
        self.performSegue(withIdentifier: "toAdditionalInfo", sender: self)
    }
    
    @IBAction func employeeButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toEmployeeList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        employeeViewModel.dOB = dateOfBirthTextField.text
        employeeViewModel.placeOfBirth = placeOfBirthTextField.text
        
        if segue.identifier == "toAdditionalInfo" {
            if let additionalInfoVC = segue.destination as? AdditionalInfoViewController {
                additionalInfoVC.employeeViewModel = employeeViewModel
            }
        } else {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("NavigationController not fount")
            }
            
            guard let employeeListVC = nav.viewControllers.first as? EmployeeListViewController else {
                fatalError("EmployeeListViewController not fount")
            }
            employeeListVC.employeeViewModel = employeeViewModel
            employeeListVC.delegate = self
        }
    }
}
