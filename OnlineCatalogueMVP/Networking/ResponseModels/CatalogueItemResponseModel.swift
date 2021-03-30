//
//  CatalogueItemResponseModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct CatalogueItemResponseModel {
    let site_id: String
    let query: String
    let paging: PagingResponseModel
    let results: [ItemResultResponseModel]
}

struct PagingResponseModel {
    let total: Int
    let primary_results: Int
    let offset: Int
    let limit: Int
}

struct ItemResultResponseModel {
    let id: String
    let title: String
    let thumbnailUrlString: String?
}
