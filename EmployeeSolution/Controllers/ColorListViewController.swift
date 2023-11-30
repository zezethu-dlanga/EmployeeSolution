//
//  ColorListViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit


protocol ColorDelegate {
    func selectedColor(viewModel: AdditionalDataModel)
}

class ColorListViewController: UITableViewController {
    
    //MARK: - Variables
    var colorListViewModel = ColorListViewModel()
    var additionalDataModel = AdditionalDataModel()
    var delegate: ColorDelegate?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        populateColors()
    }
    
    
    //MARK: - Table View
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedColor = colorListViewModel.colorDataViewModel(at: indexPath.row)
        additionalDataModel.colorName = selectedColor.colorName
        additionalDataModel.colorCode = selectedColor.colorCode
        self.delegate?.selectedColor(viewModel: additionalDataModel)
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
    private func populateColors() {
        self.showTableViewpinner(onView: self.view)
        
        self.colorListViewModel.getColorList() { result in
            if result {
                self.removeSpinner()
                self.tableView.reloadData()
            } else {
                self.removeSpinner()
            }
        }
    }
}
