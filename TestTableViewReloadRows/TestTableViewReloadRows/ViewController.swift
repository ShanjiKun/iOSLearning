//
//  ViewController.swift
//  TestTableViewReloadRows
//
//  Created by Vinh Huynh on 6/13/19.
//  Copyright © 2019 Vinh Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    enum CellType {
        case ads1
        case ads2
        case standard
        
        var content: String {
            switch self {
            case .ads1:
                return "Content Ads 1"
                
            case .ads2:
                return "Content Ads 2"
                
            default:
                return "Standard"
            }
        }
    }
    
    var items: [CellType] = [.ads1, .standard, .standard]
    
    lazy var isProcessingUpdate = false
    var itemQueue: CellType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preprocessUpdate(CellType.ads2)
    }
    
    func preprocessUpdate(_ item: CellType) {
        print("\(#function) \(item.content)")
        if isProcessingUpdate {
            itemQueue = item
        } else {
            processUpdate(item)
        }
    }
    
    var didTest = 0
    func processUpdate(_ item: CellType) {

        isProcessingUpdate = true

        print("Updating")
        tableview.performBatchUpdates({ [weak self] in

            guard let self = self else { return }
//            self.items.remove(at: 0)
//            self.tableview.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)

        }, completion: { [weak self] isSuccessed in

            guard let self = self else { return }
            self.items.insert(item, at: 0)
            self.tableview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)

            if let item = self.itemQueue {
                print("Perform Batch Updates continue handle item in queue")
                self.itemQueue = nil
                self.processUpdate(item)

            } else {
                print("Perform Batch Updates finish")
                self.isProcessingUpdate = false
                if self.didTest < 1 {
                    self.didTest += 1
                    self.testMonoAdding()
                }
            }

        })
    }
    
    func testMonoAdding() {
        preprocessUpdate(CellType.ads1)
    }
    
    func testMultiAdding() {
        for i in 0..<1000 {
            let newItem = i % 2 == 0 ? CellType.ads1 : CellType.ads2
            preprocessUpdate(newItem)
        }
    }

    
    var counter = 0
    func test1() {
        if counter == 1000 {
            return
        }
        
        let removedItem = items[0]
        self.tableview.performBatchUpdates({ [weak self] in
            
            guard let self = self else { return }
            self.items.remove(at: 0)
            self.tableview.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)

            }, completion: { [weak self] isSuccessed in
                
                guard let self = self else { return }
                let newItem = removedItem == .ads1 ? CellType.ads2 : CellType.ads1
                self.items.insert(newItem, at: 0)
                self.tableview.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
                
                print("Done: \(self.counter)")
                self.test1()
        })
        
        counter += 1
        
        print("Reloading: \(counter)")
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .ads1, .ads2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AdsTableViewCell", for: indexPath)
            cell.textLabel?.text = item.content
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            cell.textLabel?.text = item.content
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}
