//
//  ColorListResponseModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

struct ColorListResponseModel: Codable{
    let data: [Color]
}

struct Color: Codable {
    let id : Int
    let name: String
    let year: Int
    let color: String
    let pantone_value: String
}
