//
//  UITableViewController.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/24.
//

import Foundation
import UIKit

var spinner : UIView?

extension UITableViewController {
    func showTableViewpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        spinner = spinnerView
    }
    
    func removeTableViewSpinner() {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
}
