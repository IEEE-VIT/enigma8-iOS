//
//  NotificationView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import SwiftUI
import SafariServices

struct NotificationView: View {
    var notif: Notification = Notification(text: "Lorem ipsum dolor sit amet", timestamp: 12341234122)
    @State var showSafari = false
    
    var body: some View {
            HStack(spacing: 0) {
                VStack(alignment: .leading) {
                    Text(notif.text ?? "")
                    Text(notif.parsedTime)
                        .foregroundColor(.gray)
                }
                Spacer()
                if(notif.metadata != nil) {
                    CustomButton(buttonText: "VIEW", action: {showSafari = true})
                        .frame(width: 80)
                }
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: notif.metadata ?? "https://google.com")!)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
