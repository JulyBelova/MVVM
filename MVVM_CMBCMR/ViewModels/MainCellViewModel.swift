//
//  MainCellViewModel.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 31.01.2024.
//

import Foundation

class MainCellViewModel {
    var name: String
    var image: String
    
    init(_ user: Character) {
        self.name = user.name
        self.image = user.image
    }
}

//class MainCellViewModel {
//    var name: String
//    var email: String
//    
//    init(_ user: User) {
//        self.name = user.name
//        self.email = user.email
//    }
//}

