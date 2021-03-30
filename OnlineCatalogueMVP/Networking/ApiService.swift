//
//  ApiService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

class ApiService: DataService {
    
    func getSearchedData(searchedData: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>) {
        
        guard let url = UrlRouter.search.url,
              let urlString = url.appending(queryItem: "q", value: searchedData)?.absoluteString
        else { return }
        
        executeRequest(urlString: urlString, completion)
    }
    
    func getDetailedData(id: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>) {
        
        guard let url = UrlRouter.details.url else { return }
        let urlString = url.appendingPathComponent(id).absoluteString

        executeRequest(urlString: urlString, completion)
    }
}
