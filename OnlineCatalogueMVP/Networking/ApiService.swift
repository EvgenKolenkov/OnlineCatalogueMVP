//
//  ApiService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation
import Alamofire

class ApiService: DataService {
    
    func getSearchedData(urlString: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>) {
        getSearchedApiData(urlString: urlString, completion)
    }
    
    func getDetailedData(urlString: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>) {
        getDetailededApiData(urlString: urlString, completion)
    }
    
    // MARK: Private
    private func getSearchedApiData(urlString: String, _ completion: @escaping RequestResultHandler<CatalogueSearchResponseModel>) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: CatalogueSearchResponseModel.self) { response in
                if let error = response.error {
                    completion(RequestResult(error: error))
                    return
                }
                if let catalogueSearchResult = response.value {
                    completion(RequestResult(value: catalogueSearchResult))
                    return
                }
            }
    }
    
    private func getDetailededApiData(urlString: String, _ completion: @escaping RequestResultHandler<DetailedCatalogueItemResponseModel>) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: DetailedCatalogueItemResponseModel.self) { response in
                if let error = response.error {
                    completion(RequestResult(error: error))
                    return
                }
                if let detailedItem = response.value {
                    completion(RequestResult(value: detailedItem))
                    return
                }
            }
    }
}
