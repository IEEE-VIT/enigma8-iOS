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
        var powerupUsed: PowerupUsed?
        var hint: String?
    }
    
    struct Model: Codable {
        var id, text, media: String?
        var questionNo: Int?
        var mediaType: MediaType?
        var mediaURL: URL? {
            return URL(string: media ?? "https://google.com")
        }
        
        private enum CodingKeys: String, CodingKey {
            case id = "_id", questionNo, text, media
        }
        
    }
    
    enum MediaType: String, Codable {
        case img = "image/png"
        case vid = "video/mp4"
    }
    
}
