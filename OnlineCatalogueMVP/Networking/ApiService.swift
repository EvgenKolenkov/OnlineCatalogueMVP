//
//  ApiService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

class ApiService: DataService {
    
    private let requestExecuter: RequestExecuter
    
    init(requestExecuter: RequestExecuter = RequestExecuter()) {
        self.requestExecuter = requestExecuter
    }
    
    func getSearchedData<T: Decodable>(searchedData: String, _ completion: @escaping RequestResultHandler<T>) {
        
        guard let url = UrlRouter.search.url,
              let urlString = url.appending(queryItem: "q", value: searchedData)?.absoluteString
        else { return }
        
        requestExecuter.executeRequest(urlString: urlString, completion)
    }
    
    func getDetailedData<T: Decodable>(id: String, _ completion: @escaping RequestResultHandler<T>) {
        
        guard let url = UrlRouter.descriptions.url else { return }
        let urlString = url.absoluteString.replacingOccurrences(of: "id", with: id)

        requestExecuter.executeRequest(urlString: urlString, completion)
    }
}
