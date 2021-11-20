//
//  NotificationsView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var notifsVM: NotificationsViewModel = NotificationsViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            EnigmaHeader(showBackButton:true,showInstructionsButton: false,backAction:back)
            CustomLabel(text: "Notifications",font: .Cinzel()).padding(20)
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
    
    func back() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(notifsVM: NotificationsViewModel())
    }
}
