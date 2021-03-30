//
//  ApiService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

class ApiService: DataService {
    
    func getSearchedData(searchedData: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>) {
        getSearchedApiData(searchedData: searchedData, completion)
    }
    
    func getDetailedData(urlString: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>) {
        getDetailededApiData(urlString: urlString, completion)
    }
    
    // MARK: Private
    private func getSearchedApiData(searchedData: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>) {
        
        guard var baseUrl = URL(string: Constants.baseURL) else { return }
        baseUrl.appendPathComponent("sites/MLU/search")
        let queryItems = [URLQueryItem(name: "q", value: searchedData)]
        guard var urlComps = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true) else { return }
        urlComps.queryItems = queryItems
        guard let urlString = urlComps.url?.absoluteString else { return }
        
        executeRequest(urlString: urlString, completion)
    }
    
    private func getDetailededApiData(urlString: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>) {
        
        
        executeRequest(urlString: urlString, completion)
    }
}
