//
//  BasePresenter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

class BasePresenter {
    
    private(set) var handleError: ((Error) -> Void)? = nil
    private(set) var handleSpinner: ((Bool) -> Void)? = nil
    
    func connect(with model: HandledVC) {
        handleError = model.handleError
        handleSpinner = model.handleSpinner
    }
}
