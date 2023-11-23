//
//  AdditionalInfoViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/22.
//

import Foundation
import UIKit

class AdditionalInfoViewController: UIViewController {
    
    //MARK: - Variables
    var employeeViewModel = EmployeeViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    //MARK: - Action
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toReview", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let reviewVC = segue.destination as? ReviewViewController {
            reviewVC.employeeViewModel = employeeViewModel
        }
    }
}
