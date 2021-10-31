//
//  NotificationsViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notificationList: Array<Notification> = [Notification(text: "Something Something Something Something Something Something Something Something Something Something Something Something Something Something ", time: 1635670075, isViewed: false), Notification(text: "Something", time: 1635670075, isViewed: true)]
}
