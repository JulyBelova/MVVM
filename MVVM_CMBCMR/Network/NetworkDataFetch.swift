//
//  NetworkDataFetch.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 29.01.2024.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchUsers(response: @escaping ([Character]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData{ result in
            switch result {
            case.success(let data):
                do {
                    let users = try JSONDecoder().decode(CharacterResponse.self, from: data)
                    response(users.results, nil)
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                }
            case.failure(_):
                response(nil, .canNotParseData)
            }
        }
    }
}
