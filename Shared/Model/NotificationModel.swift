//
//  NotificationModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import Foundation

struct NotificationsResponse: Codable {
    var notifs: [Notification]
}

struct Notification : Codable {
    var _id: String?
    var type: String?
    var text: String?
    var timestamp: String?
    var metadata: String?
    
    var parsedTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        guard let parsedDate = dateFormatter.date(from:timestamp ?? "") else { return "some time ago" }
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
            return "just now"
        }
    }
}
