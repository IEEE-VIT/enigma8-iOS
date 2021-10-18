//
//  LeaderboardView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct LeaderboardView: View {
    var leaderboardItems: [LeaderboardItem]
    var currentUser: LeaderboardItem
    @State var userVisible: Bool = false
    @State var searchString: String = ""
    var body: some View {
        VStack {
            // TODO: Add navBarTitle
            Text("Leaderboard")
                .font(.largeTitle)
            ZStack {
                Capsule()
                    .stroke(Color.black)
                    .frame(height: 50)
                    .padding()
                HStack {
                    Image(systemName: "1.magnifyingglass")
                        .padding(.trailing)
                    TextField("Search", text: $searchString)
                }
                .padding(.horizontal, 50)
            }
            // TODO: fix LazyVStack
            ScrollView {
                LazyVStack {
                    ForEach(leaderboardItems.sorted(by: {$0.rank ?? 0 < $1.rank ?? 1}).filter{$0.username?.lowercased().hasPrefix(searchString.lowercased()) ?? false || searchString == ""}) { user in
                        LeaderboardRow(isUser: currentUser.username == user.username, user: user)
                            .onAppear {
                                if user.username == currentUser.username {
                                    self.userVisible = true
                                }
                            }
                            .onDisappear {
                                if user.username == currentUser.username {
                                    self.userVisible = false
                                }
                            }
                    }
                }
            }
            if !userVisible {
                LeaderboardRow(isUser: true, user: currentUser)
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(leaderboardItems: LeaderboardItem.data, currentUser: LeaderboardItem.data[9])
    }
}
