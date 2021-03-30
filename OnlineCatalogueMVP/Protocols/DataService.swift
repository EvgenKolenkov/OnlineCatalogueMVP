//
//  DataService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

protocol DataService {
    func getSearchedData(searchedData: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>)
    
    func getDetailedData(id: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>)
}
