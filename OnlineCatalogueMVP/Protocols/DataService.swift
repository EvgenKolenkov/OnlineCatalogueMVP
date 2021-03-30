//
//  DataService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

typealias RequestResultHandler<T> = (RequestResult<T>) -> Void

protocol DataService {
    func getSearchedData(urlString: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>)
    
    func getDetailedData(urlString: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>)
}
