//
//  SelfSizedTableView.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import UIKit

protocol LayoutDelegate: class {
    func didUpdateHeight(_ value: CGFloat)
}

class SelfSizedTableView: UITableView {
    
    @IBOutlet private weak var heightConstraint: NSLayoutConstraint!
    
    weak var layoutDelegate: LayoutDelegate?

    override var contentSize: CGSize {
        set {
            super.contentSize = newValue
            heightConstraint.constant = newValue.height
            layoutDelegate?.didUpdateHeight(newValue.height)
        }
        get {
            return super.contentSize
        }
    }

    func hide() {
        heightConstraint.constant = 0.0
    }
}
