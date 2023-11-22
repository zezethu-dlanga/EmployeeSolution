//
//  EmployeeViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class EmployeeViewController: UIViewController {
    
    //MARK: - Outlets
    
    
    //MARK: - Variables
    private var employeeViewModel = EmployeeViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
}
