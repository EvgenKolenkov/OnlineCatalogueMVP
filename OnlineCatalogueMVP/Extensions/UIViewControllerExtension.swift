//
//  UIViewControllerExtension.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit

extension UIViewController {
    
    func vc(identifier: String) -> UIViewController? {
        return storyboard?.instantiateViewController(withIdentifier: identifier)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok".localized, style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok".localized, style: .cancel, handler: handler)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
