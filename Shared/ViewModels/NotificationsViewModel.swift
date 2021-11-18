//
//  NotificationsViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notificationList: [Notification] = []
    
    func getNotifications() {
        APIClient.request(fromRouter: Router.notifications) { (response: NotificationsResponse?, error) in
            guard let notifs = response?.notifs as? [Notification] else {
                Logger.error(error ?? "ERROR")
                return
            }
            self.notificationList = notifs
        }
    }
}
