//
//  QuestionModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 13/11/21.
//

import Foundation

struct Question: Codable {
    struct Request:Codable {
        let roomId: String
    }
    struct Response: Codable {
        var question: Model?
        var powerupDetails: Powerup.PowerupModel?
        var powerupStatus: String?
        var hint: String?
        
        private enum CodingKeys: String, CodingKey {
            case question
            case powerupDetails
            case powerupStatus = "powerupUsed"
            case hint
        }
        
        var powerupUsed: PowerupUsed {
            return PowerupUsed(rawValue: powerupStatus ?? "null") ?? .null
        }
    }
    
    struct Model: Codable {
        var id, text, media: String?
        var questionNo: Int?
        var mediaType: String?
        var mediaURL: URL? {
            return URL(string: media ?? "https://google.com")
        }
        
        var type: MediaType {
            return MediaType(rawValue: mediaType ?? "") ?? .img
        }
        
        private enum CodingKeys: String, CodingKey {
            case id = "_id", questionNo, text, media, mediaType
        }
        
    }
    
    enum MediaType: String, Codable {
        case img = "image/png"
        case vid = "video/mp4"
    }
    
}
