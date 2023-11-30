//
//  SuccessfulViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/22.
//

import Foundation
import UIKit

class SuccessfulViewController: UIViewController {
    
    //MARK: - Variables
    var successfulDataModel = SuccessfulDataModel()
    
    
    //MARK: - Outlets
    @IBOutlet weak var messageLabel: UILabel!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        let date = DateUtil.getDate(timestamp: successfulDataModel.createdAt ?? "") ?? ""
        let time = DateUtil.getTime(timestamp: successfulDataModel.createdAt ?? "") ?? ""
                                    
        messageLabel.text = "Congratulations you have successfully updated personal details and additional details for \(successfulDataModel.fullName ?? "") on \(date) at \(time)"
    }
    
    
    //MARK: - Action
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: EmployeeViewController.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
