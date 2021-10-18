//
//  RoomModel.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import Foundation

struct RoomModel: Identifiable, Codable {
    var id: Int?
    var roomNo: Int?
    var media: String?
    var title: String?
    var starQuota: Int?
    var roomUnlocked: Bool?
    var powerUpId: Int?
    var powerUpUsed: Bool?
    var stars: Int?
    var question1: String?
    var question2: String?
    var question3: String?
    
    var mediaURL: URL? {
        URL(string: media ?? "")
    }
    
    private enum CodingKeys: String, CodingKey {
        case powerUpId = "power_up_id"
        case powerUpUsed  = "power_up_used"
        case id = "roomId"
    }
}

extension RoomModel {
    static var sampleData: [RoomModel] = [
        RoomModel(id: 1, roomNo: 1, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 2, roomNo: 2, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 3, roomNo: 3, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 4, roomNo: 4, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 5, roomNo: 5, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 6, roomNo: 6, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 7, roomNo: 7, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
        RoomModel(id: 8, roomNo: 8, media: "https://instagram.fblr1-5.fna.fbcdn.net/v/t51.2885-15/e35/21041268_334214487023871_2342691114194042880_n.jpg?_nc_ht=instagram.fblr1-5.fna.fbcdn.net&_nc_cat=103&_nc_ohc=vfes5M_2orgAX-1BYZd&edm=AP_V10EBAAAA&ccb=7-4&oh=0a75beea80a47e709e684d5c3d5bdfdb&oe=6173A8E2&_nc_sid=4f375e", title: "NameOfRoom", starQuota: 12, roomUnlocked: false, powerUpId: 23, powerUpUsed: false, stars: 12, question1: "locked", question2: "locked", question3: "locked"),
    ]
}
