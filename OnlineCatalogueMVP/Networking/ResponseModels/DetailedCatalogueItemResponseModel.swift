//
//  DetailedCatalogueItemResponseModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct DetailedCatalogueItemResponseModel: Decodable {
    let official_store_id: String?
    let title: String?
    let descriptions: [CatalogueItemDescription]?
    let price: Int?
    let pictures: [CatalogueItemPicture]?
}

struct CatalogueItemPicture: Decodable {
    let id: String?
    let url: String?
    let secure_url: String?
    let size: String?
    let max_size: String?
    let quality: String?
}

struct CatalogueItemDescription: Decodable {
    let text: String?
    let plain_text: String?
    let last_updated: String?
    let date_created: String?
}
