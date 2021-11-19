//
//  EnigmaHeader.swift
//  Enigma (iOS)
//
//  Created by Alok N on 15/10/21.
//

import SwiftUI

struct EnigmaHeader: View {
    var showBackButton: Bool = false
    var hideHeaderIcons: Bool = false
    var showInstructionsButton: Bool = true

    @EnvironmentObject var headerVM : HeaderRules
    
    var body: some View {
        VStack(spacing:0) {
            HStack {
                if(!hideHeaderIcons) {
                    if(showBackButton) {
                        Button(action: {self.headerVM.showInstructions = false; self.headerVM.showNotifications = false;self.headerVM.showRoom = false}) {
                            Image(ImageConstants.back)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                        }
                    } else {
                        
                        Button {
                            Logger.debug("NOTIF")
                            self.headerVM.showNotifications = true
                        } label: {
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
                if(showInstructionsButton) {
                    Button {
                        Logger.debug("INSTRUCTIONS")
                        self.headerVM.showInstructions = true
                    } label: {
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
