//
//  DataService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

typealias RequestResultHandler<T> = (RequestResult<T>) -> Void

protocol DataService {
    func getData(urlString: String, _ completion: @escaping RequestResultHandler<CatalogueItemResponseModel>)
}
