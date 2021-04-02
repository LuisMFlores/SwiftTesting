//
//  URLSessionProtocol.swift
//  TestingSwift
//
//  Created by luis flores on 4/2/21.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
}
