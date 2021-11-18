//
//  NotificationsView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import SwiftUI

struct NotificationsView: View {
    @ObservedObject var notifsVM: NotificationsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            CustomLabel(text: "Notifications",font: .Cinzel())
                .padding(20)
            ScrollView {
                LazyVStack {
                    ForEach(notifsVM.notificationList) { notification in
                        NotificationRow(notif: notification)
                    }
                }
            }
        }
        .background(NotificationBackground())
        .onAppear(perform: notifsVM.getNotifications)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(notifsVM: NotificationsViewModel())
    }
}
