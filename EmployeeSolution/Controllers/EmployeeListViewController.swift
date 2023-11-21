//
//  EmployeeListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class EmployeeListViewController: UITableViewController {
    
    var employeeListViewModel = EmployeeListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateEmployees()
    }
    
    private func populateEmployees() {
        guard let url = URL(string: "https://reqres.in/api/users?page=1&per_page=12") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<EmployeeListResponseModel>(url: url)
        
        Webservice().load(resource: resource) { [weak self] result in
            switch result {
                case .success(let employees):
                    self?.employeeListViewModel.employeeListViewModel = employees.data.map(EmployeeDataViewModel.init)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeListViewModel.employeeListViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.employeeListViewModel.employeeDataViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = viewModel.fullName
        cell.detailTextLabel?.text = viewModel.email
        
        return cell
    }
}
