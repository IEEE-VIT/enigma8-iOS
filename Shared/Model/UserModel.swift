//
//  UserModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/5/21.
//

import Foundation

struct UserModel: Codable {
    var username: String?
    var email: String?
    var doubleScore: Double?
    var stars: Int?
    var rank: Int?
    var currentRoomId: String?
    
    private enum CodingKeys: String, CodingKey {
        case username = "username"
        case email = "email"
        case doubleScore = "score"
        case stars = "starts"
        case rank = "rank"
        case currentRoomId = "currentRoomId"
    }
    
    var score: Int {
        return Int(doubleScore ?? 0.0)
    }
}
