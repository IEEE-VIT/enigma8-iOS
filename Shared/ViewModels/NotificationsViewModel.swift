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
    
    init() {
        getNotifications()
    }
    
    func getNotifications() {
        APIClient.request(fromRouter: Router.notifications) { (response: NotificationsResponse?, error) in
            guard let response = response else {return}
            self.notificationList = response.notifs
            self.isFetched = true
        }
    }
}
