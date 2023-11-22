//
//  UIView.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

extension UIView {
    
    //Use IBInspectable to expose property to the Attributes Inspector tab
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
        
    }
        
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
        
    }
}
