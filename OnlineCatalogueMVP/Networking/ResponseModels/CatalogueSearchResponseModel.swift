//
//  CatalogueSearchResponseModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct CatalogueSearchResponseModel: Decodable {
    let query: String?
    let results: [CatalogueItemResponseModel]?
}

struct CatalogueItemResponseModel: Decodable {
    let id: String?
    let catalog_product_id: String?
    let title: String?
    let price: Double?
    let currency_id: String?
    let thumbnail: String?
}
