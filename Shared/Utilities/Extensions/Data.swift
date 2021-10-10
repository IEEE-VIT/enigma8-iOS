//
//  Data.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 9/27/21.
//

import Foundation

extension Data {
    
    func toJSON() throws -> NSString {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { throw NSError() }
        
        return prettyPrintedString
    }
}
