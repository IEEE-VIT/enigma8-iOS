//
//  ProfileView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/5/21.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage(AppStorageConstants.onboarding) var onboarded: Bool = false
    @AppStorage(AppStorageConstants.login) var userLoggedIn: Bool = true
    @AppStorage(AppStorageConstants.enigmaStarted) var enigmaStarted: Bool = true
    @AppStorage(AppStorageConstants.instructionsShown) var instructionsShown: Bool = false
    @EnvironmentObject var userVM: RoomsViewModel
    var body: some View {
        VStack {
            ProfileViewHeader()
            Spacer()
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Username: ")
                            Text("Score: ")
                            Text("Rank: ")
                            Text("Stars: ")
                            Text("Email: ")
                        }
                        .foregroundColor(Color.eGold)
                        VStack(alignment: .leading, spacing: 10) {
                            Text(self.userVM.user?.username ?? "username")
                            Text(String(format: "%.2f", self.userVM.user?.score ?? 0))
                            Text("\(self.userVM.user?.rank ?? 0)")
                            Text("\(self.userVM.user?.stars ?? 0)")
                            Text(self.userVM.user?.email ?? "email@email.com")
                        }
                        .foregroundColor(Color.eBlue)
                        Spacer()
                    }
                    .font(.Mulish(size: 18, weight: .semibold))
                }
                .padding()
                Text("PROGRESS")
                    .font(.Mulish(size:18, weight: .regular))
                    .foregroundColor(Color.eGold)
               
                RoomProgressView(width: UIScreen.main.bounds.width * 0.66)
                Spacer()
                HStack {
                    CustomButton(buttonText:"LOGOUT", action: {
                        userLoggedIn = false
                    })
                }
                .padding()
                
            }
        }
        .padding()
        .background(Image("UserProfileViewBG").resizable().frame(width: UIScreen.main.bounds.width))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
