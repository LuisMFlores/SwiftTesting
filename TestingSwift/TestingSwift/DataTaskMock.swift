//
//  DataTaskMock.swift
//  TestingSwift
//
//  Created by luis flores on 4/2/21.
//

import Foundation

class DataTaskMock: URLSessionDataTask {
    
    var completionHandler: (Data?, URLResponse?, Error?) -> Void
    var hasStarted = false
    var testData: Data?
    var testError: AppPurchasingError?
    
    init(with completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.completionHandler = completionHandler
    }
    override func resume() {
        hasStarted = true
        completionHandler(testData,nil,testError)
    }
}
