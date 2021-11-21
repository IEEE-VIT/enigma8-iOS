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
        var room: Room?
    }
    
    struct UseRequest: Codable {
        var roomId: String?
    }
    
    struct UseResponse: Codable {
        var powerUp: PowerupModel?//might need change
        var text: String?
        var data: String?
        var imgURL: String?
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
        
        var iconURL: URL? {
            return URL(string: icon ?? "https://www.shareicon.net/data/2017/03/02/880210_images_512x512.png")
        }
        
        var isAvailable: Bool {
            return available ?? false
        }
        
        private enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name = "name"
            case detail = "detail"
            case icon = "icon"
            case available = "available_to_use"
        }
    }
}
