//
//  LeaderboardView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct LeaderboardView: View {
    @StateObject var leaderboardVM: LeaderboardViewModel = LeaderboardViewModel()
    @State var userVisible: Bool = false
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
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing)
                    TextField("Search", text: $leaderboardVM.searchQuery, onCommit: {
                        leaderboardVM.searchLeaderboard()
                    })
                }
                .padding(.horizontal, 50)
            }
            ScrollView {
                LazyVStack {
                    ForEach(leaderboardVM.leaderboard, id: \.self) { user in
                        LeaderboardRow(isUser: leaderboardVM.currentUser?.username == user.username, user: user)
                            .onAppear {
                                leaderboardVM.fetchMorePages(currentRow: user)
                                if user.username == leaderboardVM.currentUser?.username {
                                    self.userVisible = true
                                }
                            }
                            .onDisappear {
                                if user.username == leaderboardVM.currentUser?.username {
                                    self.userVisible = false
                                }
                            }
                    }
                }
            }
            if !userVisible, leaderboardVM.currentUser != nil {
                LeaderboardRow(isUser: true, user: leaderboardVM.currentUser!)
            }
        }
        .onAppear(perform: leaderboardVM.fetchLeaderboard)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
