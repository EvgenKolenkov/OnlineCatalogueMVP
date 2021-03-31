//
//  UITableViewExtension.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit

enum ScrollDirection {
    case top, bottom
}

extension UITableView {
    
    func getCell<T>(ofType type: T.Type) -> T {
        
        let nibName = "\(type)"
        
        guard let cell = dequeueReusableCell(withIdentifier: nibName) as? T else {
            register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
            return dequeueReusableCell(withIdentifier: nibName) as! T
        }
        
        return cell
    }
    
    func scroll(to: ScrollDirection, animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
            let numberOfSections = self.numberOfSections
            let numberOfRows = self.numberOfRows(inSection: numberOfSections-1)
            switch to{
            case .top:
                if numberOfRows > 0 {
                     let indexPath = IndexPath(row: 0, section: 0)
                     self.scrollToRow(at: indexPath, at: .top, animated: animated)
                }
                break
            case .bottom:
                if numberOfRows > 0 {
                    let indexPath = IndexPath(row: numberOfRows-1, section: (numberOfSections-1))
                    self.scrollToRow(at: indexPath, at: .bottom, animated: animated)
                }
                break
            }
        }
    }
    
    public func reloadData(_ completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion:{ _ in
            completion()
        })
    }
}
