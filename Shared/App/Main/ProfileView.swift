//
//  ProfileView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/5/21.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("userLoggedIn") var isLoggedIn: Bool = true
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
                            Text("Leaderboard Ranking: ")
                            Text("Stars Earned: ")
                            Text("Email: ")
                        }
                        .foregroundColor(Color.eGold)
                        VStack(alignment: .leading, spacing: 10) {
                            Text(self.userVM.user?.username ?? "username")
                            Text("\(self.userVM.user?.score ?? 0)")
                            Text("\(self.userVM.user?.rank ?? 0)")
                            Text("\(self.userVM.user?.stars ?? 0)")
                            Text(self.userVM.user?.email ?? "email@email.com")
                        }
                        .foregroundColor(Color.eBlue)
                        Spacer()
                    }
                    .font(.Mulish(size: 14, weight: .semibold))
                }
                .padding()
                Text("PROGRESS")
                    .font(.Mulish(size:14, weight: .regular))
                    .foregroundColor(Color.eGold)
               
                RoomProgressView(width: UIScreen.main.bounds.width * 0.66)
                Spacer()
                // TODO: WRAP IN NAVIGATION LINK, DESTINATION LOGINVIEW
                HStack {
                    CustomButton(buttonText:"LOGOUT", action: {
                        isLoggedIn = false
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
