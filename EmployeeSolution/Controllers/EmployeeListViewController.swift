//
//  EmployeeListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class EmployeeListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateEmployees()
    }
    
    private func populateEmployees() {
        guard let url = URL(string: "https://reqres.in/api/users?page=1&per_page=12") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<EmployeeListResponseModel>(url: url)
        
        Webservice().load(resource: resource) { result in
            switch result {
                case .success(let employees):
                    print(employees)
                case .failure(let error):
                    print(error)
            }
        }
    }
}
