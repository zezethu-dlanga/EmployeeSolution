//
//  CircleView.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation
import UIKit

@IBDesignable
class CircleView: UIView {

    @IBInspectable var borderColor: UIColor = UIColor.red;
    @IBInspectable var borderSize: CGFloat = 4

    override func draw(_ rect: CGRect)
    {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderSize
        layer.cornerRadius = self.frame.height/2
    }
}
