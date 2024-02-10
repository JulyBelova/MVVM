//
//  EndPoint.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 29.01.2024.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        components.path = "/api/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        print("url \(url)")
        return url
    }
}

extension EndPoint {
    static var users: Self {
        EndPoint(path: "character")
    }
}

