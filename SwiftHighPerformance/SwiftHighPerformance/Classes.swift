//
//  Classes.swift
//  SwiftHighPerformance
//
//  Created by Vinh Huynh on 5/29/19.
//  Copyright © 2019 Vinh Huynh. All rights reserved.
//

import Foundation

class Person {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

class JournalEntry {
    let title: String
    let text: String
    let date: Date
    
    init(title: String, text: String, date: Date) {
        self.title = title
        self.text = text
        self.date = date
    }
}
