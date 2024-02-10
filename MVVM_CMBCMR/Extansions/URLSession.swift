//
//  URLSession.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 29.01.2024.
//

import Foundation

extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(_ endPoint: EndPoint, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endPoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}
