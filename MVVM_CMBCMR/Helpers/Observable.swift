//
//  Observable.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 30.01.2024.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listerer?(self.value)
            }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listerer: ((T?) -> Void)?
    
    func bind(_ listerer: @escaping ((T?) -> Void)) {
        listerer(value)
        self.listerer = listerer
    }
}
