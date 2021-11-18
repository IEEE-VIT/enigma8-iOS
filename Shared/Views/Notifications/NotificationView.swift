//
//  NotificationView.swift
//  Enigma (iOS)
//
//  Created by Alok N on 31/10/21.
//

import SwiftUI
import SafariServices

struct NotificationRow: View {
    var notif: Notification = Notification(text: "Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet", timestamp: 16341234122,metadata:"")
    @State var showSafari = false
    @State var showFeedback = false
    
    var body: some View {
        HStack(alignment:.top, spacing: 12) {
                Image(ImageConstants.bullet)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width * 0.04)
            VStack(alignment: .leading,spacing:8) {
                    Text(notif.text ?? "")
                        .foregroundColor(.eGold)
                        .font(.Mulish(size: 13, weight: .regular))
                        .offset(y: -4)
                    Text(notif.parsedTime)
                        .foregroundColor(.eBlue)
                        .font(.Mulish(size: 11, weight: .bold))
                }
            Spacer()
                if(notif.metadata != nil) {
                    Button(action: view) {
                    CustomLabel(text: "VIEW")
                    }
                    .padding(2.5)
                    .padding(.horizontal,12.5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(LinearGradient.gold, lineWidth: 1))
                }
        }
        .padding(16)
        .sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: notif.metadata ?? "https://google.com")!)
        }
        .sheet(isPresented: $showFeedback) {
            FeedbackUI()
        }
    }
    
    func view() {
        self.showSafari = true
    }
}

struct NotificationRow_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRow()
            .previewLayout(.sizeThatFits)
            .background(Color.black)
    }
}
