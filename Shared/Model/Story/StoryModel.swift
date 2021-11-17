//
//  StoryModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 10/10/21.
//

import Foundation
import SwiftUI

struct Story:Codable, Hashable, Identifiable {
    var id = UUID()
    var roomNo: String?
    var sender: String?
    var message: String?
    
    private enum CodingKeys: String, CodingKey {
        case roomNo
        case sender
        case message
    }
    
    var senderEnum: StorySender {
        StorySender(rawValue: self.sender ?? "Ali") ?? .sender1
    }
    
    init(roomNo: String?, sender: String?, message: String?) {
        self.roomNo = roomNo
        self.sender = sender
        self.message = message
    }
    static let storySample: Story = Story(roomNo: "1", sender: "Ali", message: "...")
    
    static let storyMJ: Story = Story(roomNo: "1", sender: "MJ", message: "Hey.")
    
}

enum StorySender: String {
    case sender1 = "Ali"
    case sender2 = "MJ"
    
    var color: Color {
        switch self{
        case .sender1: return .eGold
        case .sender2: return .eBlue
        }
    }
    
    var titleAlignment: HorizontalAlignment {
        switch self{
        case .sender1: return .leading
        case .sender2: return .trailing
        }
    }
    
    var bubbleAlignment: Alignment {
        switch self{
        case .sender1: return .trailing
        case .sender2: return .leading
        }
    }
    
    var leadingAchor: CGFloat {
        switch self{
        case .sender1: return 0.25
        case .sender2: return 0.05
        }
    }
    
    var trailingAchor: CGFloat {
        switch self{
        case .sender1: return 0.05
        case .sender2: return 0.25
        }
    }
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
