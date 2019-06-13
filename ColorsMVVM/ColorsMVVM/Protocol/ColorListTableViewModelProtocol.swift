//
//  ColorListTableViewModelProtocol.swift
//  ColorsMVVM
//
//  Created by Vinh Huynh on 5/31/19.
//  Copyright © 2019 Vinh Huynh. All rights reserved.
//

import Foundation

protocol ColorListTableViewModelProtocol {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath: IndexPath) -> ColorListTableViewCellViewModel
}
