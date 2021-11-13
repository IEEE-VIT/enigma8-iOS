//
//  StoryModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 10/10/21.
//

import Foundation

struct Story:Codable, Hashable {
    var roomNo: String?
    var sender: String?
    var message: String?
    var senderEnum: StorySender {
        StorySender(rawValue: self.sender ?? "person1") ?? .sender1
    }
    
    init(roomNo: String?, sender: String?, message: String?) {
        self.roomNo = roomNo
        self.sender = sender
        self.message = message
    }
    static let storySample: Story = Story(roomNo: "1", sender: "person1", message: "Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet Lorem Ipsum Dolor Sit amet")
    
}

enum StorySender: String {
    case sender1 = "person1"
    case sender2 = "person2"
}

class StoryModel {
    struct Request: Codable {
        let roomId: String?
        
        init(roomId: String) {
            self.roomId = roomId
        }
    }
    struct Response: Codable {
        var story: [Story?]?
    }
}
