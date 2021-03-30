//
//  RequestResultModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct RequestResultModel<T> {
    
    let error: Error?
    let value: T?
    
    init(value: T?, error: Error?) {
        self.value = value
        self.error = error
    }
    
    init(value: T) {
        self.value = value
        self.error = nil
    }
    
    init(error: Error) {
        self.value = nil
        self.error = error
    }
}
