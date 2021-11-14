//
//  HintModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 14/11/21.
//

import Foundation

struct Hint : Codable {
    struct Response : Codable {
        var hint: String?
    }
    struct Request: Codable {
        var roomId: String
    }
}
