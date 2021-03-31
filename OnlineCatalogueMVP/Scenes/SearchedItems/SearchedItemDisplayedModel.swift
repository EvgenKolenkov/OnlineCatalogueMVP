//
//  SearchedItemDisplayedModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct SearchedItemDisplayedModel {
    let id: String?
    let title: String?
    let price: Double?
    let currency: String?
    let thumbnailUrlString: String?
    
    init(responseModel: CatalogueItemResponseModel) {
        self.id = responseModel.id
        self.title = responseModel.title
        self.price = responseModel.price
        self.currency = responseModel.currency_id
        self.thumbnailUrlString = responseModel.thumbnail
    }
}
