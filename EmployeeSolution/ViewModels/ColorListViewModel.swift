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
    
    func getColorList(completion: @escaping (Bool) -> ()) {
        guard let url = URL(string: Path.getCodeList.rawValue) else {
            fatalError("URL was incorrect")
        }
        
        let resource = Resource<ColorListResponseModel>(url: url)
        
        Webservice().load(resource: resource) { [weak self] result in
            switch result {
                case .success(let colors):
                    self?.colorListViewModel = colors.data.map(ColorDataViewModel.init)
                    completion(true)
                case .failure(let error):
                    print(error)
                    completion(false)
            }
        }
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
