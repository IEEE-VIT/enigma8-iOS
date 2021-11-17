//
//  NotificationBackground.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 17/11/21.
//

import SwiftUI

struct NotificationBackground: View {
    var body: some View {
        Image(ImageConstants.pharoah)
            .resizable()
            .scaledToFit()
            .opacity(0.2)
            .frame(width: UIScreen.main.bounds.width * 0.6)
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .background(Color.black)
    }
}

struct NotificationBackground_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBackground()
    }
}
