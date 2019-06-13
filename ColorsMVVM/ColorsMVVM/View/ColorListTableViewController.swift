//
//  ColorListTableViewController.swift
//  ColorsMVVM
//
//  Created by Vinh Huynh on 5/31/19.
//  Copyright © 2019 Vinh Huynh. All rights reserved.
//

import UIKit

class ColorListTableViewController: UITableViewController {
    
    fileprivate let colorListViewModel = ColorListTableViewModel()
    
    // MARK: UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorListViewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ColorListTableViewCell.self), for: indexPath)
        return cell
    }
}
