//
//  Users.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 29.01.2024.
//

import Foundation

struct CharacterResponse: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: Status
    let type: String
    let gender: Gender
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
//struct User: Codable {
//    
//    let name: String
//    let username: String
//    let email: String
//    let address: Address
//    let phone: String
//    
//}
//
//struct Address: Codable {
//    let street: String
//    let suite: String
//    let city: String
//}
