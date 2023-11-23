//
//  SuccessfulViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/22.
//

import Foundation
import UIKit

class SuccessfulViewController: UIViewController {
    
    //MARK: - Variables
    var employeeViewModel = EmployeeViewModel()
    
    
    //MARK: - Outlets
    @IBOutlet weak var messageLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        messageLabel.text = "Congratulations you have successfully updated personal details and additional details for \(employeeViewModel.fullName ?? "") at \(employeeViewModel.createdAt ?? "")"
    }
    
    
    //MARK: - Action
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
}
