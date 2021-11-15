//
//  HeaderNavView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct HeaderNavView: View {
    //TODO: Set up appstorage
//    TODO: in AuthVM, when sign in is successful add a userdefault "isSignedIn". Here, if isSignedIn is true, you display this View, otherwise display the LoginView
    @State var tabSelected = 0
    var body: some View {
        VStack {
            EnigmaHeader()
            switch(tabSelected){
            case 0:
                RoomsView(rooms: RoomsViewModel())
            case 1:
                LeaderboardView()
            case 2:
                FullStoryView(storyViewModel: StoryViewModel(roomId: "")) // TODO: call user/getDetails route in StoryViewModel to get current room and reload StoryVM when it changes
            case 3:
                ProfileView()
            default:
                LoginView(authVM: AuthViewModel())
            }
            TabBarView(tabSelected: $tabSelected)
        }
        
    }
}

struct HeaderNavView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderNavView()
    }
}
