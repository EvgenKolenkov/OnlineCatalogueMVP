//
//  UrlRouter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

enum UrlRouter: String {
    case search = "sites/MLU/search"
    case details = "items/id"
    case descriptions = "items/id/descriptions"
    
    var url: URL? {
        return URL(string: Constants.baseURL)?.appendingPathComponent(self.rawValue)
    }
}
