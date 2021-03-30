//
//  ItemTableViewCell.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = .label
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = .secondaryLabel
    }

    func configureWith(model: SearchedItemDisplayedModel) {
        titleLabel.text = model.title
        if let price = model.price {
            priceLabel.text = String(price)
        } else {
            priceLabel.text = "-"
        }
    }
}