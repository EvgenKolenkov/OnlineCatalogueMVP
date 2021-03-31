//
//  UIScrollViewExtension.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import UIKit

extension UIScrollView {
    
    func scrollToBottom() {
        let maxOffset = contentSize.height - frame.height
        if maxOffset <= 0 { return }
        setContentOffset(CGPoint(x: contentOffset.x, y: maxOffset), animated: true)
    }
    
    func scrollToTop() {
        setContentOffset(CGPoint(x: contentOffset.x, y: 0.0), animated: true)
    }
}
