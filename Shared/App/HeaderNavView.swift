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
    @EnvironmentObject var headerVM : HeaderRules

    var body: some View {
        NavigationView {
            
        VStack {
            
            NavigationLink(destination: NotificationsView().navigationTitle("").navigationBarHidden(true),isActive: $headerVM.showNotifications){
                EmptyView()
            }
            
            NavigationLink(destination: InstructionsView().navigationTitle("").navigationBarHidden(true),isActive: $headerVM.showInstructions){
                EmptyView()
            }
            
            EnigmaHeader()
            switch(tabSelected){
            case 0:
                RoomsView()
            case 1:
                LeaderboardView()
            case 2:
                FullStoryView(storyViewModel: StoryViewModel(roomId: ""))
            case 3:
                ProfileView()
            default:
                LoginView(authVM: AuthViewModel())
            }
                EnigmaTabView(tabSelected: $tabSelected)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)//both hiddens required

        }
    }
}

struct HeaderNavView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderNavView()
            .environmentObject(RoomsViewModel())
    }
}

class HeaderRules: ObservableObject {
    @Published var showNotifications: Bool = false
    @Published var showInstructions: Bool = false

}
