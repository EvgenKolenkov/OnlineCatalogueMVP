//
//  DetailedCatalogueItemResponseModel.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

struct CatalogueItemDescription: Decodable {
    let id: String?
    let created: String?
    let text: String?
    let plain_text: String?
}
