//
//  UrlRouter.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 30.03.2021.
//

import Foundation

enum UrlRouter: String {
    case search = "sites/MLU/search"
    case descriptions = "items/id/descriptions"
    
    private var baseURL: String {
        "https://api.mercadolibre.com"
    }
    
    var url: URL? {
        return URL(string: baseURL)?.appendingPathComponent(self.rawValue)
    }
}
