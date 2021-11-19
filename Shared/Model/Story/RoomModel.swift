//
//  RoomModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import Foundation
import SwiftUI

struct RoomsModel: Codable, Hashable {
    var journey: Journey?
    var room: Room?
 
    static var data = RoomsModel(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["solved","unlocked","locked"]), room: Room(id: "1234", roomNo: "3", questionId: [], media: "https://firebasestorage.googleapis.com/v0/b/enigma-8.appspot.com/o/Room%2FRoom%207.png?alt=media&token=adc9c32c-18e8-4d28-bd26-30dd00192d39", title: "Room 3", starQuota: 0))
}

struct RoomUnlock {
    struct RoomUnlockRequest: Codable {
        var roomId: String?
    }
    struct RoomUnlockResponse: Codable {
        var roomStatus: String?
        var starsNeeded: Int?
        
        
        private enum CodingKeys: String, CodingKey {
            case starsNeeded = "starsNeeded"
            case roomStatus = "status"
        }
        
        var status: RoomStatus {
            return RoomStatus(rawValue: roomStatus ?? "locked") ?? .locked
        }
    }
}

enum RoomStatus: String {
    case locked = "locked"
    case canUnlock = "canUnlock"
    case unlocked = "unlocked"
    case complete = "complete"
}

struct AllRoomsResponse: Codable {
    var data: [RoomsModel?]?
}
struct Room: Codable, Hashable {
    var _id: String?
    var roomNo: String?
    var questionId: [String?]?
    var media: String?
    var title: String?
    var starQuota: Int?
    
    
    var mediaURL: URL? {
        URL(string: media ?? "")
    }
    
    init(id: String?, roomNo: String?, questionId: [String?]?, media: String?, title: String?, starQuota: Int?) {
        self._id = id
        self.roomNo = roomNo
        self.questionId = questionId
        self.media = media
        self.title = title
        self.starQuota = starQuota
    }
}

struct Journey: Codable, Hashable {
    var _id: String?
    var userId: String?
    var roomId: String?
    var stars: Int?
    var powerupUsed: PowerupUsed?
    var roomUnlocked: Bool?
    var powerupId: String?
    var questionsStatus: [questionStatus]?
    
    init(id: String?, userId: String?, roomId: String?, stars: Int?, powerupUsed: PowerupUsed,roomUnlocked: Bool?, powerupId: String?, questionsStatus: [String]?) {
        self._id = id
        self.userId = userId
        self.roomId = roomId
        self.stars = stars
        self.powerupUsed = powerupUsed
        self.roomUnlocked = roomUnlocked
        self.powerupId = powerupId
        if let questionsStatus = questionsStatus {
            self.questionsStatus = questionsStatus.map { questionStatus(rawValue: $0) ?? .locked }
        }
        
    }
    
    var roomStatus: questionStatus {
        guard let questionsStatus = questionsStatus else {
            return .null
        }
        
        if !(roomUnlocked ?? true) {
            return .locked
        }
        
        if questionsStatus == Array(repeating: .solved, count: 3) {
            return .solved
        }else {
            return .unlocked
        }
        
    }
    
    var isSmooth : Bool {
        return roomStatus == .solved
    }
    
    var showArrow: Bool {
        return (roomStatus == .solved) || (roomStatus == .unlocked)
    }
}

enum PowerupUsed: String, Codable {
    case yes = "yes"
    case no = "no"
    case active = "active"
    case null = ""
}

enum questionStatus: String, Codable {
    case solved = "solved"
    case locked = "locked"
    case unlocked = "unlocked"
    case null = ""
    
    var color: Color {
        switch self {
        case .solved:
            return .roomGreen
        case .locked, .null:
            return .roomGrey
        case .unlocked:
            return .roomBlue
        }
    }
    
    var roomColor: Color {
        switch self {
        case .solved:
            return .roomGreen
        case .locked, .null:
            return .roomGrey
        case .unlocked:
            return .roomBlue
        }
    }
    
    var progressImage: String {
        if self == .solved {
            return "Key"
        } else {
            return "unsolved_key"
        }
    }
}


extension AllRoomsResponse {
    static let sampleData: AllRoomsResponse = AllRoomsResponse(data: [
        RoomsModel(journey: Journey(id: nil, userId: nil, roomId: nil, stars: 0, powerupUsed: .yes, roomUnlocked: false, powerupId: nil, questionsStatus: ["locked", "locked", "locked"]),room: Room(id: "61656a08fdeca6f21cf87708", roomNo: "3", questionId: [
            "61621059336ae702be39fe7a"
        ], media: "https://google.com/url?cd=vfe&psig=AOvVaw2CnTXmnerWF7EZiB1oqpQK&sa=i&source=images&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2F&ust=1633859516954000&ved=0CAsQjRxqFwoTCMDUiJOHvfMCFQAAAAAdAAAAABAD", title: "Room 3", starQuota: 30))
    ])
}

/// Sample Response from Backend
/*
 "room": {
 "_id": "61656a08fdeca6f21cf87708",
 "roomNo": "3",
 "questionId": [
 "61621059336ae702be39fe7a"
 ],
 "media": "https://google.com/url?cd=vfe&psig=AOvVaw2CnTXmnerWF7EZiB1oqpQK&sa=i&source=images&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2F&ust=1633859516954000&ved=0CAsQjRxqFwoTCMDUiJOHvfMCFQAAAAAdAAAAABAD",
 "title": "Room 3",
 "starQuota": 30
 },
 "journey": {
 "_id": null,
 "userId": null,
 "roomId": null,
 "stars": 0,
 "powerupUsed": false,
 "roomUnlocked": false,
 "powerupId": null,
 "questionsStatus": [
 "locked",
 "locked",
 "locked"
 ]
 }
 */
