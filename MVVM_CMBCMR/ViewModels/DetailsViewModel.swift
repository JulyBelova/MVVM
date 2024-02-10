//
//  DetailsViewModel.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 31.01.2024.
//

import Foundation

class DetailsViewModel {
    
    let id: Int
    let name: String
    let status: String
    let type: String
    let gender: String
    let location: String
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    init(user: Character) {
        self.id = user.id
        self.name = user.name
        self.status = user.status.rawValue
        self.type = user.type
        self.gender = user.gender.rawValue
        self.location = user.location.name
        self.image = user.image
        self.episode = user.episode
        self.url = user.url
        self.created = user.created
    }
    
}

//class DetailsViewModel {
//    
//    let name: String
//    let username: String
//    let email: String
//    let phone: String
//    
//    let street: String
//    let suite: String
//    let city: String
//    
//    init(user: User) {
//        self.name = user.name
//        self.username = user.username
//        self.email = user.email
//        self.phone = user.phone
//        
//        self.street = user.address.street
//        self.suite = user.address.suite
//        self.city = user.address.city
//    }
//}
