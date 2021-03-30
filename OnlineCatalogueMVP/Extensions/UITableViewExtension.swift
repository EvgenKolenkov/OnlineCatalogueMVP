//
//  UITableViewExtension.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit

extension UITableView {
    
    func getCell<T>(ofType type: T.Type) -> T {
        
        let nibName = "\(type)"
        
        guard let cell = dequeueReusableCell(withIdentifier: nibName) as? T else {
            register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
            return dequeueReusableCell(withIdentifier: nibName) as! T
        }
        
        return cell
    }
}
