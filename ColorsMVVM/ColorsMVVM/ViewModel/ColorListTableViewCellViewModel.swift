//
//  ColorListTableViewCellViewModel.swift
//  ColorsMVVM
//
//  Created by Vinh Huynh on 5/31/19.
//  Copyright © 2019 Vinh Huynh. All rights reserved.
//

class ColorListTableViewCellViewModel: ColorListTableViewCellViewModelProtocol {
    var title: String
    init(title: String) {
        self.title = title
    }
}
