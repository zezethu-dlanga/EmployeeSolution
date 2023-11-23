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
    var employeeViewModel = EmployeeViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: - Action
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toSuccessful", sender: self)
        
        Webservice().load(resource: EmployeeRequestModel.create(viewModel: self.employeeViewModel)) { result in
            switch result {
                case .success(let response):
                    if let response = response {
                        //Done, go to success screen
                    }
                case .failure(let error):
                    print(error)
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let successVC = segue.destination as? SuccessfulViewController {
            successVC.employeeViewModel = employeeViewModel
        }
    }
}
