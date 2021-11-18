//
//  EnigmaHeader.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI

struct EnigmaHeader: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var showBackButton: Bool = false
    var hideHeaderIcons: Bool = false
    var body: some View {
        VStack(spacing:0) {
            HStack {
                if(!hideHeaderIcons) {
                    if(showBackButton) {
                        Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                            Image(ImageConstants.back)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                    } else {
                        NavigationLink(destination: NotificationsView(notifsVM: NotificationsViewModel()).navigationTitle("").navigationBarHidden(true)){
                            Image(ImageConstants.notifs)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .gradientForeground(colors: [.goldGradientStart, .goldGradientEnd])
                                .frame(width: 25, height: 25)
                        }
                    }
                }
                Spacer()
                Image(ImageConstants.enigmaOnlyLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width*0.3)
                    .font(.system(size: 25))
                Spacer()
                if(!hideHeaderIcons) {
                    NavigationLink(destination: InstructionsView().navigationTitle("").navigationBarHidden(true)){
                        Image(ImageConstants.info)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                }
            }.padding()
            .background(Color.black)
            Rectangle().fill(Color.goldGradientEnd).frame(height: 1)
        }
    }
}

struct EnigmaHeader_Previews: PreviewProvider {
    static var previews: some View {
        EnigmaHeader()
    }
}
