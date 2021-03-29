//
//  Tweet.swift
//  TestingSwift
//
//  Created by luis flores on 3/29/21.
//

import Foundation

struct Tweet {
    let text: String
    let author: String
    let date: Date
    
    init(text: String, author: String, date: Date = Date()) {
        self.text = text
        self.author = author
        self.date = date
    }
}
