//
//  UIViewController+storyboard.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import UIKit

extension UIViewController: Storyboarded { }

enum Storyboard: String {
    case main = "Main"

    private var instance: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }

    func instantiateViewController<T: UIViewController>(withIdentifier id: String) -> T {
        return instance.instantiateViewController(withIdentifier: id) as! T
    }
}
