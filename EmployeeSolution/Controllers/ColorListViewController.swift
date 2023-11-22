//
//  ColorListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

class ColorListViewController: UITableViewController {
    
    var colorListViewModel = ColorListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateColors()
    }
    
    private func populateColors() {
        guard let url = URL(string: "https://reqres.in/api/unknown?per_page=12") else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<ColorListResponseModel>(url: url)
        
        Webservice().load(resource: resource) { [weak self] result in
            switch result {
                case .success(let colors):
                    self?.colorListViewModel.colorListViewModel = colors.data.map(ColorDataViewModel.init)
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
        return self.colorListViewModel.colorListViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.colorListViewModel.colorDataViewModel(at: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as? ColorTableViewCell else {
            fatalError("ColorTableViewCell not found")
        }
        
        cell.colorNameLabel?.text = viewModel.colorName
        cell.colorCodeView.backgroundColor = UIColor(hex: viewModel.colorCode)
        
        return cell
    }
}
