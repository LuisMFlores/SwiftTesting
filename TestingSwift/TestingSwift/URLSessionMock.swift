//
//  URLSessionMock.swift
//  TestingSwift
//
//  Created by luis flores on 4/2/21.
//

import Foundation

class URLSessionMock: URLSessionProtocol {
    
    var lastURL: URL?
    var dataTask: DataTaskMock?
    var testData: Data?
    var testError: AppPurchasingError?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastURL = url
        let dataTask = DataTaskMock(with: completionHandler)
        self.dataTask = dataTask
        self.dataTask?.testData = testData
        self.dataTask?.testError = testError
        return dataTask
    }
}
