//
//  Data.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/27/21.
//

import Foundation

extension Data {
    
    func toJSON() throws -> [String: Any] {
        guard let dictionary = try JSONSerialization.jsonObject(with: self, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
