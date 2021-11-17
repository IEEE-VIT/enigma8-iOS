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
    @State var showClear: Bool = false
    @State var query: String = ""
    var body: some View {
        GeometryReader { wholeGeo in
        VStack(alignment: .center) {
            Text("Leaderboard")
                .font(.Cinzel(size: 25))
                        .gradientForeground(colors: [.goldGradientStart,.goldGradientEnd])
                        .padding(.leading)
                        .padding(.top, 20)
                        .frame(width: wholeGeo.size.width, alignment: .leading)
                .frame(height: 35)
            ZStack {
                Capsule()
                    .stroke(Color.black)
                    .frame(height: 40)
                    .padding()
                    .gradientForeground(colors: [.goldGradientStart,.goldGradientEnd])
                HStack {
                    Image(systemName: "magnifyingglass")
                        .gradientForeground(colors: [.goldGradientStart,.goldGradientEnd])
                        .padding(.trailing)
                    TextField("Search", text: $query, onCommit: {
                        leaderboardVM.fetchLeaderboard(query: query)
                        self.showClear = true
                    }).font(.Mulish(weight:.semibold))
                        .foregroundColor(.eGold)
                    if(showClear) {
                        Button(action: {
                            self.query = ""
                            self.showClear = false
                            leaderboardVM.fetchLeaderboard(query:"")
                        }) {
                            Text("Clear")
                        }.foregroundColor(Color.eGold)
                    }
                }
                .padding(.horizontal, 50)
            }
            GeometryReader { geo in
                ZStack {
                LeaderboardHeader(geo:geo)
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(leaderboardVM.leaderboard, id: \.self) { user in
                            LeaderboardRow(isUser: leaderboardVM.currentUser?.username == user.username,geo:geo, user: user)
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
                    }.background(Color(white: 1, opacity:0.1))
                }.padding(.top, 30)
                if !userVisible, leaderboardVM.currentUser != nil {
                    LeaderboardRow(isUser: true,geo:geo, user: leaderboardVM.currentUser!)
                        .padding(.top, geo.size.height*0.7)
                }
                }
            }.frame(width: UIScreen.main.bounds.width*0.95, alignment: .center)
                
        }
        }.background(Color.eBlack)
        .onAppear(perform: { leaderboardVM.fetchLeaderboard(reload: true) })
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
