//
//  Storyboarded.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}

extension Storyboarded where Self: UIViewController {

    static func instantiate(from storyboard: Storyboard = .main) -> Self {
        let id = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
