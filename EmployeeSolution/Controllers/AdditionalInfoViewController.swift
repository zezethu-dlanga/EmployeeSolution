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
    var employeeViewModel = EmployeeViewModel()
    
    
    //MARK: - Outlets
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var colorNameLabel: UILabel!
    @IBOutlet weak var colorCodeView: UIView!
 
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func selectedColor(viewModel: EmployeeViewModel) {
        employeeViewModel = viewModel
        colorNameLabel?.text = employeeViewModel.colorName
        colorCodeView.backgroundColor = UIColor(hex: employeeViewModel.colorCode ?? "")
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
            employeeViewModel.gender = sender.titleForSegment(at: 0)
        case 1:
            employeeViewModel.gender = sender.titleForSegment(at: 1)
        case 2:
            employeeViewModel.gender = sender.titleForSegment(at: 2)
        default:
            break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        employeeViewModel.residentialAddress = addressTextField.text
        
        if segue.identifier == "toReview" {
            if let reviewVC = segue.destination as? ReviewViewController {
                reviewVC.employeeViewModel = employeeViewModel
            }
        } else {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("NavigationController not fount")
            }
            
            guard let colorListVC = nav.viewControllers.first as? ColorListViewController else {
                fatalError("ColorListViewController not fount")
            }
            colorListVC.employeeViewModel = employeeViewModel
            colorListVC.delegate = self
        }
    }
}
