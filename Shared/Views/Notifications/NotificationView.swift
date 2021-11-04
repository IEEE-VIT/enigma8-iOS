//
//  NotificationView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import SwiftUI

struct NotificationView: View {
    var notif: Notification = Notification(text: "Lorem ipsum dolor sit amet", timestamp: "2021-11-04T15:09:58.620Z")
    
    var body: some View {
            HStack(spacing: 0) {
                //TODO: Decide on if notification seen logic
//                notif.isViewed! ? Image(systemName: "circle").padding() : Image(systemName: "circle.fill").padding()
                VStack(alignment: .leading) {
                    Text(notif.text!)
                    Text(notif.parsedTime)
                        .foregroundColor(.gray)
                }
                Spacer()
                CustomButton(buttonText: "VIEW")
                    .frame(width: 80)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
