//
//  DataService.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

protocol DataService {
    func getSearchedData<T: Decodable>(searchedData: String, _ completion: @escaping RequestResultHandler<T>)
    func getDetailedData<T: Decodable>(id: String, _ completion: @escaping RequestResultHandler<T>)
}
