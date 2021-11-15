//
//  HeaderNavView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct HeaderNavView: View {
    @State var tabSelected = 0
    var body: some View {
        VStack {
            EnigmaHeader()
            TabView(selection: $tabSelected) {
                RoomsView(rooms: RoomsViewModel())
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                                .font(.system(size:10))
                        }
                    }
                    .tag(0)
                LeaderboardView()
                    .tabItem {
                        VStack {
                            Image(systemName: "chart.bar")
                            Text("Leaderboard")
                                .font(.system(size: 10))
                        }
                    }
                    .tag(1)
                FullStoryView(storyViewModel: StoryViewModel(roomId: ""))
                    .tabItem {
                        VStack {
                            Image(systemName: "book")
                            Text("Story")
                                .font(.system(size:10))
                        }
                    }
                    .tag(2)
                ProfileView(userVM: ProfileViewModel())
                    .tabItem {
                        VStack {
                            Image(systemName: "person.crop.circle")
                            Text("Profile")
                                .font(.system(size: 10))
                        }
                    }
                    .tag(3)
            }
        }
    }
}

struct HeaderNavView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderNavView()
    }
}