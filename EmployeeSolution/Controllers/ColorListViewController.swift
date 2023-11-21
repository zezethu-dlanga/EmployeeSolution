//
//  ColorListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class ColorListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateColors()
    }
    
    private func populateColors() {
        guard let url = URL(string: "https://reqres.in/api/unknown?per_page=12") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<ColorListResponseModel>(url: url)
        
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
