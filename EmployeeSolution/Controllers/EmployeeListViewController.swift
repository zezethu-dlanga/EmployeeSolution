//
//  EmployeeListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

protocol EmployeeDelegate {
    func selectedEmployee(viewModel: EmployeeViewModel)
}

class EmployeeListViewController: UITableViewController {
    
    //MARK: - Variables
    var employeeListViewModel = EmployeeListViewModel()
    var employeeViewModel = EmployeeViewModel()
    var delegate: EmployeeDelegate?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateEmployees()
    }
    
    
    //MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.employeeListViewModel.employeeListViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.employeeListViewModel.employeeDataViewModel(at: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell else {
            fatalError("EmployeeTableViewCell not found")
        }
        
        cell.fullNameLabel?.text = viewModel.fullName
        cell.emailLabel?.text = viewModel.email
        cell.avatarImageView.image = UIImage(url: URL(string: viewModel.avatar))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEmployee = employeeListViewModel.employeeDataViewModel(at: indexPath.row)
        employeeViewModel.id = selectedEmployee.id
        employeeViewModel.firstName = selectedEmployee.firstName
        employeeViewModel.lastName = selectedEmployee.lastName
        employeeViewModel.fullName = selectedEmployee.fullName
        employeeViewModel.email = selectedEmployee.email
        employeeViewModel.avatar = selectedEmployee.avatar
        self.delegate?.selectedEmployee(viewModel: employeeViewModel)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Helper methods
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
}
