//
//  ProfileView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/5/21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var userVM = ProfileViewModel()
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: ContentView()) {
                    Image(systemName: "lock.circle.fill")
                        .scaleEffect(2)
                    //                        .padding()
                        .foregroundColor(Color.black)
                }
                Spacer()
            }
            // TODO: REPLACE WITH NAVIGATION TITLE
            Text("MY PROFILE")
                .font(.largeTitle)
                .padding()
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("Username: \(userVM.username)")
                Text("Score: \(userVM.score)")
                Text("Leaderboard Ranking: \(userVM.rank)")
                Text("Stars Earned: \(userVM.stars)")
                Text("Email: \(userVM.email)")
            }
            Spacer()
            // TODO: WRAP IN NAVIGATION LINK, DESTINATION LOGINVIEW
            HStack {
                Spacer(minLength: 100)
                CustomButton(buttonText: "LOGOUT", action: {})
                Spacer(minLength: 100)
            }
            .padding()
            
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
