//
//  NotificationModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import Foundation

struct Notification : Codable {
    var text: String?
    var time: Double?
    var isViewed: Bool?
    
    var parsedTime: String {
        let date = Calendar.current.dateComponents([.month, .day, .hour, .minute, .second], from: Date(timeIntervalSince1970: time ?? 1635670075), to: Date())
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
            return "just now"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case text = "text"
        case time = "time"
        case isViewed = "isViewed"
    }
}
