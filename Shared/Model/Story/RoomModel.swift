//
//  RoomModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import Foundation

struct RoomsModel: Codable, Hashable {
    var journey: Journey?
    var room: Room?
    
}

struct AllRoomsResponse: Codable {
    var data: [RoomsModel]?
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
    
//    private enum CodingKeys: String, CodingKey {
//        case id = "_id"
//    }
}

struct Journey: Codable, Hashable {
    var _id: String?
    var userId: String?
    var roomId: String?
    var stars: Int?
    var powerupUsed: Bool?
    var roomUnlocked: Bool?
    var powerupId: String?
    var questionsStatus: [String?]?
    var question3: String?
    var question1: String?
    var question2: String?
    
    init(id: String?, userId: String?, roomId: String?, stars: Int?, powerupUsed: Bool?, roomUnlocked: Bool?, powerupId: String?, questionsStatus: [String?]?, question3: String?, question2: String?, question1: String?) {
        self._id = id
        self.userId = userId
        self.roomId = roomId
        self.stars = stars
        self.powerupUsed = powerupUsed
        self.roomUnlocked = roomUnlocked
        self.powerupId = powerupId
        self.questionsStatus = questionsStatus
        self.question1 = question1
        self.question2 = question2
        self.question3 = question3
    }
    
//    private enum CodingKeys: String, CodingKey {
//        case id = "_id"
//    }
}

extension AllRoomsResponse {
    static let sampleData: AllRoomsResponse = AllRoomsResponse(data: [
        RoomsModel(journey: Journey(id: nil, userId: nil, roomId: nil, stars: 0, powerupUsed: false, roomUnlocked: false, powerupId: nil, questionsStatus: ["locked", "locked", "locked"], question3: "locked", question2: "locked", question1: "locked"),room: Room(id: "61656a08fdeca6f21cf87708", roomNo: "3", questionId: [
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
