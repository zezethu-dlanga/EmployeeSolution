//
//  ColorListViewModel.swift
//  EmployeeSolution
//
//  Created by Zezethu Dlanga on 2023/11/21.
//

import Foundation

class ColorListViewModel {
    var colorListViewModel: [ColorDataViewModel]
    
    init() {
        self.colorListViewModel = [ColorDataViewModel]()
    }
    
    func colorDataViewModel(at index: Int) -> ColorDataViewModel {
        return self.colorListViewModel[index]
    }
}

struct ColorDataViewModel {
    let color: Color
    
    var id: Int {
        return self.color.id
    }
    
    var colorCode: String {
        return self.color.color
    }
    
    var colorName: String {
        return self.color.name
    }
}
