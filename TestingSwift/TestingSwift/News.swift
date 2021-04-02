//
//  News.swift
//  TestingSwift
//
//  Created by luis flores on 4/1/21.
//

import UIKit

class News {
    var url: URL
    var stories = ""
    
    init(with url: URL) {
        self.url = url
    }
    
    func fetch(with urlSession: URLSessionProtocol = URLSession.shared, completionHandler: @escaping () -> Void) {
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            if let data = data {
                self.stories = String(decoding: data, as: UTF8.self)
            }
            completionHandler()
        }
        task.resume()
    }
}
