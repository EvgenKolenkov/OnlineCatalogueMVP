//
//  CatalogueSearchResponseModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct CatalogueSearchResponseModel: Decodable {
    let site_id: String?
    let query: String?
    let paging: PagingResponseModel?
    let results: [CatalogueItemResponseModel]?
}

struct PagingResponseModel: Decodable {
    let total: Int?
    let primary_results: Int?
    let offset: Int?
    let limit: Int?
}

struct CatalogueItemResponseModel: Decodable {
    let id: String?
    let title: String?
    let price: Double?
    let currency_id: String?
    let thumbnail: String?
}
