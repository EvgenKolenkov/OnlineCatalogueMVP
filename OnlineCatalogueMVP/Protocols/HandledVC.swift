//
//  HandledVC.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit
import NVActivityIndicatorView

protocol HandledVC {
    var handleError: (Error) -> Void { get }
    var handleSpinner: (Bool) -> Void { get }
}

extension HandledVC where Self: UIViewController {
    
    var handleError: (Error) -> Void {
        return { [weak self] error in
            self?.handleSpinner(false)
            self?.showError(error: error)
        }
    }
    
    var handleSpinner: (Bool) -> Void {
        return { isLoading in
            if isLoading {
                self.navigationController?.showHUD = true

            } else {
                self.navigationController?.showHUD = false
            }
        }
    }
}
