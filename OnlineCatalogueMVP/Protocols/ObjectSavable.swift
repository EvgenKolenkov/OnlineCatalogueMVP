//
//  ObjectSavable.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import Foundation

protocol ObjectSavable {
    func setObject<T: Encodable>(_ object: T, forKey: String) throws
    func getObject<T: Decodable>(forKey: String, castTo type: T.Type) throws -> T
}

enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
