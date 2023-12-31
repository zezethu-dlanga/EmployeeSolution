//
//  EmployeeListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

protocol EmployeeDelegate {
    func selectedEmployee(viewModel: EmployeeDataModel)
}

class EmployeeListViewController: UITableViewController {
    
    //MARK: - Variables
    var employeeListViewModel = EmployeeListViewModel()
    var employeeDataModel = EmployeeDataModel()
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
        employeeDataModel.id = selectedEmployee.id
        employeeDataModel.firstName = selectedEmployee.firstName
        employeeDataModel.lastName = selectedEmployee.lastName
        employeeDataModel.fullName = selectedEmployee.fullName
        employeeDataModel.email = selectedEmployee.email
        employeeDataModel.avatar = selectedEmployee.avatar
        self.delegate?.selectedEmployee(viewModel: employeeDataModel)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let lastVisibleIndexPath = tableView.indexPathsForVisibleRows?.last {
            if indexPath == lastVisibleIndexPath {
                self.removeTableViewSpinner()
            }
        }
    }
    
    
    //MARK: - Helper methods
    private func populateEmployees() {
        self.showTableViewpinner(onView: self.view)
        self.employeeListViewModel.getEmployeeList() { result in
            if result {
                self.removeSpinner()
                self.tableView.reloadData()
            } else {
                self.removeSpinner()
            }
        }
    }
}
