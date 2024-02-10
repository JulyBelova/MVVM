//
//  NetworkRequest.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 29.01.2024.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.users) {data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(.failure(.urlError))
                } else {
                    guard let data else {
                        return
                    }
                    completionHandler(.success(data))
                }
            }
        }
    }
}
