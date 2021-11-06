//
//  NotificationsView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var notifsVM: NotificationsViewModel = NotificationsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Notifications")
                    .font(.system(size: 30))
                    .bold()
                if(notifsVM.isFetched) {
                    if (notifsVM.notificationList.isEmpty) {
                        VStack(alignment: .center, spacing: 10) {
                            Spacer()
                            Image(systemName: "bell.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: 200, alignment: .center)
                                .padding(.bottom)
                            Text("Nothing Yet!")
                                .bold()
                            Text("Come Back Soon for more.")
                            Spacer()
                        }
                    } else {
                        LazyVStack {
                            ForEach( 0 ..< notifsVM.notificationList.count) { i in
                                NotificationView(notif: notifsVM.notificationList[i])
                            }
                        }
                    }
                }
            }
        }.padding()
        .onAppear(perform: notifsVM.getNotifications)
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
