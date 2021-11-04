//
//  StoryModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 10/10/21.
//

import Foundation

struct Story:Codable {
    var sender: String?
    var message: String?
    var icon: String?
    var index: Int?

    var iconURL: URL? {
        return URL(string: icon ?? "")
    }
    
    private enum CodingKeys: String, CodingKey {
        case sender = "sender"
        case message = "message"
        case icon = "sender_icon"
        case index = "index"
    }
    
    static let storySample: Story = Story(sender: "John AppleSeed", message: "Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet", icon: "https://upload.wikimedia.org/wikipedia/commons/f/fc/Johnny_Appleseed_photograph.jpg", index: 0)
    
}

class StoryModel {
    struct Request: Codable {
        let roomId: String?
        
        init(roomId: String) {
            self.roomId = roomId
        }
    }
    struct Response: Codable {
        var story: [String?]?
    }
}
