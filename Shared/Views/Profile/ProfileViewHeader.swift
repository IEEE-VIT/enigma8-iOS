//
//  ProfileViewHeader.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/18/21.
//

import SwiftUI

struct ProfileViewHeader: View {
    @Binding var showPrivacyPolicy: Bool
    var body: some View {
        HStack {
            CustomLabel(text: "MY PROFILE",font: .Cinzel(size: 24, weight: .bold))
            Spacer()
            Image("PrivacyIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 23)
                .onTapGesture {
                    self.showPrivacyPolicy = true
                }
        }    }
}

struct ProfileViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewHeader(showPrivacyPolicy: .constant(false))
    }
}
