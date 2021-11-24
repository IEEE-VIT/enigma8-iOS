//
//  LeaderboardView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/18/21.
//

import SwiftUI

struct LeaderboardView: View {
    @StateObject var leaderboardVM: LeaderboardViewModel = LeaderboardViewModel()
    @EnvironmentObject var timerVM: TimerViewModel
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @State var userVisible: Bool = false
    @State var showClear: Bool = false
    @State var query: String = ""
    var body: some View {
        GeometryReader { wholeGeo in
            VStack(alignment: .center,spacing:0) {
            HStack(alignment:.center) {
                CustomLabel(text: "Leaderboard",font: .Cinzel(size: 26))
                        .frame(width: wholeGeo.size.width * 0.55, alignment: .leading)
                .frame(height: 35)
                TimerBlockView(components: timerVM.enigmaDateComponents, width: wholeGeo.size.width/2.78,hideBottom:true)

            }
            .padding(15)
            .frame(maxWidth: wholeGeo.size.width)
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
                        leaderboardVM.leaderboard = []
                        leaderboardVM.fetchLeaderboard(query: query)
                        self.showClear = true
                    }).font(.Mulish(weight:.semibold))
                        .accentColor(.eGold)
                        .autocapitalization(.none)
                        .foregroundColor(.eGold)
                    if(showClear) {
                        Button(action: {
                            self.query = ""
                            self.showClear = false
                            leaderboardVM.showNoUser = false
                            leaderboardVM.leaderboard = []
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
                    LeaderboardHeader(showLines: !leaderboardVM.showNoUser, geo:geo)
                    VStack(spacing: 0) {
                        ScrollView {
                            if(leaderboardVM.showNoUser) {
                                Image("Booo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60)
                                    .padding(.top, geo.size.height/4)
                                Text("This username does not exist")
                                    .font(.Mulish(size: 20))
                                    .foregroundColor(.eRed)
                            }
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
                            }
                        }.background(Color(white: 1, opacity:0.1))
                        .padding(.top, 30)
                        if !userVisible, leaderboardVM.currentUser != nil {
                            LeaderboardRow(isUser: true,geo:geo, user: leaderboardVM.currentUser!)
                                .background(Color(white: 1, opacity:0.1))
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.width*0.95, alignment: .center)
                
        }
        }.background(Color.eBlack)
            .onReceive(timer, perform: performCountdown)

        .onAppear(perform: { leaderboardVM.fetchLeaderboard(reload: true) })
    }
    
    func performCountdown(_ output: Timer.TimerPublisher.Output) {
        guard timerVM.performCountdown() else {
            self.timer.upstream.connect().cancel()
            timerVM.getLeftTime()
            return
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
            .environmentObject(TimerViewModel())
    }
}
