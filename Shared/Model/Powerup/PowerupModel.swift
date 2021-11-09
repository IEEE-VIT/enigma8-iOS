//
//  PowerupModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 05/11/21.
//

import Foundation

struct Powerup: Codable {
    
    struct SelectRequest: Codable {
        var roomId: String?
        var powerupId: String?
    }
    
    struct SelectResponse: Codable {
        var powerup: PowerupModel?
        var room: RoomModel?//TODO: might require change
    }
    
    struct Response: Codable {
        var powerups: [PowerupModel]?
    }
    
    struct PowerupModel: Codable, Identifiable {
        var id: String?
        var name: String?
        var detail: String?
        var icon: String?
        var available: Bool?
        
        private enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name = "name"
            case detail = "detail"
            case icon = "icon"
            case available = "available_to_use"
        }
    }
}
