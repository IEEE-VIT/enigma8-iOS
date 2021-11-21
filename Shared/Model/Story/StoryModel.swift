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
        StorySender(rawValue: self.sender ?? "Ali") ?? .voice
    }
    
    var notMainCharacter: Bool {
        return senderEnum != .sender1 && senderEnum != .sender2
    }
    
    init(roomNo: String?, sender: String?, message: String?) {
        self.roomNo = roomNo
        self.sender = sender
        self.message = message
    }
    static let storySample: Story = Story(roomNo: "1", sender: "Ali", message: "...")
    
    static let storyMJ: Story = Story(roomNo: "1", sender: "MJ", message: "Hey.")
    static let chars: [Story] = [Story(roomNo: "0", sender: "Montana Jones", message: "From the great land of red blooded Montanna, you grew up as the son of a museum curator. Those long nights alone in the museum’s Egyptian section only increased your fascination towards the ancient civilization. After having your first major breakthrough in the valley, you’ve been given the chance of a lifetime to make an independent excavation in the ever mysterious tomb of king Tuttenkhamun. With your trusted sidekick Ali by your side, you enter the tomb"), Story(roomNo: "0", sender: "Abdul Ali", message: "Your loyal sidekick. Born and brought up in Egypt, Ali has always been fascinated with the history of his land. From the age of 18, Ali has been a worker for several excavation teams in and around the Valley of Kings(the ancient burial site of Pharaohs). In your first ever independent excavation, Ali helped guide you around the traditions and culture practiced by the people of the land. After discovering a tomb room, Ali was caught under a collapsing roof structure. You led a team into the collapsing structure and pulled Ali out from the depths. Ever since, Ali has been helping you as a lead excavator in all your projects.")]
    
}

enum StorySender: String {
    case sender1 = "Ali"
    case sender2 = "MJ"
    case voice = "voice"
    case narrator = "narrator"
    
    var color: Color {
        switch self{
        case .sender1: return .eGold
        case .sender2: return .eBlue
        case .narrator: return .white
        default: return .black
        }
    }
    
    var titleAlignment: HorizontalAlignment {
        switch self{
        case .sender1: return .leading
        case .sender2: return .trailing
        default: return .center
        }
    }
    
    var bubbleAlignment: Alignment {
        switch self{
        case .sender1: return .trailing
        case .sender2: return .leading
        default: return .center
        }
    }
    
    var leadingAchor: CGFloat {
        switch self{
        case .sender1: return 0.25
        case .sender2: return 0.05
        case .narrator: return 0.06
        default: return 0.13
        }
    }
    
    var trailingAchor: CGFloat {
        switch self{
        case .sender1: return 0.05
        case .sender2: return 0.25
        case .narrator: return 0.06
        default: return 0.13
        }
    }
    
    var backgroundColor: LinearGradient {
        switch self{
        case .sender1: return LinearGradient(colors: [Color.storyGrey], startPoint: .top, endPoint: .bottom)
        case .sender2: return LinearGradient(colors: [Color.storyGrey], startPoint: .top, endPoint: .bottom)
        case .narrator: return LinearGradient(colors: [Color.clear], startPoint: .top, endPoint: .bottom)
        default: return LinearGradient.voice
        }
    }
    
    var titleGradient: LinearGradient {
        switch self{
        case .sender1: return .gold
        case .sender2: return .gold
        case .narrator: return LinearGradient(colors: [Color.clear], startPoint: .top, endPoint: .bottom)
        default: return .voice
        }
    }
    
    var font: Font {
        switch self{
        case .sender1: return .Mulish(size: 15, weight: .semibold)
        case .sender2: return .Mulish(size: 15, weight: .semibold)
        case .narrator: return .system(size: 13, weight: .light)
        default: return .Mulish(size: 15, weight: .semibold)
        }
    }
    
    var backgroundOpacity: Double {
        switch self{
        case .sender1: return 1
        case .sender2: return 1
        case .narrator: return 1
        default: return 0.75
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
