//
//  Tweet.swift
//  TestingSwift
//
//  Created by luis flores on 3/30/21.
//

import Foundation

struct Tweet {
    var text: String
    var author: String
    var date: Date
    
    init(text: String, author: String, date: Date = Date()) {
        self.text = text
        self.author = author
        self.date = date
    }
}
