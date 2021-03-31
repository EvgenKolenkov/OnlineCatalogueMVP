//
//  UserDefaults+ObjectSavable.swift
//  OnlineCatalogueMVP
//
//  Created by Evgeniy Kolenkov on 31.03.2021.
//

import Foundation

extension UserDefaults: ObjectSavable {
    func setObject<T: Encodable>(_ object: T, forKey: String) throws {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func getObject<T: Decodable>(forKey: String, castTo type: T.Type) throws -> T {
        guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
}

enum UserDefaultsKeys: String {
    case lastVisited
}
