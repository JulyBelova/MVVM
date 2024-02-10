//
//  MainViewModel.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 29.01.2024.
//
import Foundation
import UIKit

class MainViewModel {
    
    let isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSourse: [User]?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        dataSourse?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchUsers { [weak self] users, error in
            guard let self else { return }
            self.isLoading.value = false
            if let users {
                self.dataSourse = users
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSourse?.compactMap({ MainCellViewModel($0) })
    }
}
