//
//  RequestExecuter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation
import Alamofire

typealias RequestResultHandler<T> = (RequestResultModel<T>) -> Void

class RequestExecuter {
    
    func executeRequest<T: Decodable>(urlString: String, _ completion: @escaping RequestResultHandler<T>) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: T.self) { response in
                if let error = response.error {
                    completion(RequestResultModel(error: error))
                    return
                }
                if let value = response.value {
                    completion(RequestResultModel(value: value))
                    return
                }
            }
    }
}
