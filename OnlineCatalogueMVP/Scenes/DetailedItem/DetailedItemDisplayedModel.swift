//
//  DetailedItemDisplayedModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import Foundation

struct DetailedItemDisplayedModel {
    let productNumber: String?
    let title: String?
    let descriptionId: String?
    let price: Double?
    let pictureUrlString: String?
    
    init(responseModel: DetailedCatalogueItemResponseModel) {
        self.productNumber = responseModel.catalog_product_id
        self.title = responseModel.title
        self.descriptionId = responseModel.descriptions?.first?.id
        self.price = responseModel.price
        self.pictureUrlString = responseModel.pictures?.first?.secure_url
    }
}
