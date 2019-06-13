
//
//  ColorListTableViewModel.swift
//  ColorsMVVM
//
//  Created by Vinh Huynh on 5/31/19.
//  Copyright © 2019 Vinh Huynh. All rights reserved.
//

import Foundation

class ColorListTableViewModel {
    fileprivate let colors: [Color] = [
        Color(name: "Red", color: .red),
        Color(name: "Yellow", color: .yellow),
        Color(name: "Green", color: .green),
    ]
}

extension ColorListTableViewModel: ColorListTableViewModelProtocol {
    func numberOfRows() -> Int {
        return colors.count
    }
    
    func cellViewModel(forIndexPath: IndexPath) -> ColorListTableViewCellViewModel {
        
    }
}
