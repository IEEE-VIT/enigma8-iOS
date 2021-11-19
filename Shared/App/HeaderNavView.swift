//
//  HeaderNavView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct HeaderNavView: View {
    @State var tabSelected = 0
    @EnvironmentObject var rooms : RoomsViewModel
    var body: some View {
        VStack(spacing: 0) {
            EnigmaHeader()
            switch(tabSelected){
            case 0:
                RoomsView(rooms: _rooms)
                    .navigationTitle("")
                    .navigationBarHidden(true)
            case 1:
                LeaderboardView()
            case 2:
                FullStoryView(storyViewModel: StoryViewModel(roomId: "61876de9bec3682ed95c2221"))
            case 3:
                ProfileView()
            default:
                LoginView(authVM: AuthViewModel())
            }
                EnigmaTabView(tabSelected: $tabSelected)
        }
       
        .background(Color.black.edgesIgnoringSafeArea(.top))
        .background(Color.eBlack.edgesIgnoringSafeArea(.bottom))
        
    }
}

struct HeaderNavView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderNavView()
            .environmentObject(RoomsViewModel())
    }
}
