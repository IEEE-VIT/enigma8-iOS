//
//  NotificationsViewModel.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notificationList: [Notification] = []
    @Published var isFetched = false
    
    func getNotifications() {
        APIClient.request(fromRouter: Router.notifications) { (response: NotificationsResponse?, error) in
            guard let response = response else {return}
            if let notifs = response.notifs as? [Notification] { // Checking type
                self.notificationList = notifs
                self.isFetched = true
            } else {
                print(response.notifs)
            }
        }
    }
}
