//
//  NotificationModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import Foundation

struct NotificationsResponse: Codable {
    var notifs: [Notification?]
}

struct Notification : Codable {
    var id: String?
    var type: String?//TODO: enum social, feedback safari if type != feedback
    var text: String?
    var timestamp: Double?
    var metadata: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case type = "type"
        case timestamp = "timestamp"
        case metadata = "metadata"
        case text = "text"
    }
    
    var parsedTime: String {
        let parsedDate = Date(timeIntervalSince1970: (timestamp ?? 0)/1000) //Backend gives epoch time in milliseconds
        let date = Calendar.current.dateComponents([.month, .day, .hour, .minute, .second], from: parsedDate, to: Date())
        if let month = date.month, month > 0 {
            return month == 1 ? "\(month) month ago": "\(month) months ago"
        } else if let day = date.day, day > 0 {
            return day == 1 ? "\(day) day ago" : "\(day) days ago"
        } else if let hour = date.hour, hour > 0 {
            return hour == 1 ? "\(hour) hour ago" : "\(hour) hours ago"
        } else if let minute = date.minute, minute > 0 {
            return minute == 1 ? "\(minute) minute ago" : "\(minute) minutes ago"
        } else if let second = date.second, second > 0 {
            return second == 1 ? "\(second) second ago" : "\(second) seconds ago"
        } else {
            return "some time ago"
        }
    }
}
