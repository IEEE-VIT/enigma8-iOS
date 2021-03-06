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
    @StateObject var timerVM: TimerViewModel = TimerViewModel()
    @State var showPrivacyPolicy: Bool = false
    var body: some View {
        NavigationView {
            
            VStack(spacing: 0) {
            
            NavigationLink(destination: NotificationsView().navigationTitle("").navigationBarHidden(true),isActive: $headerVM.showNotifications){
                EmptyView()
            }
            
            NavigationLink(destination: InstructionsView().navigationTitle("").navigationBarHidden(true),isActive: $headerVM.showInstructions){
                EmptyView()
            }
                
            NavigationLink(destination: PrivacyPolicy().navigationTitle("").navigationBarHidden(true),isActive: $showPrivacyPolicy){
                    EmptyView()
                }
            
            EnigmaHeader()
                    .blur(radius: rooms.presentPopup ? 3 : 0)
                
            switch(tabSelected){
            case 0:
                RoomsView()
            case 1:
                LeaderboardView().environmentObject(timerVM)
            case 2:
                FullStoryView(storyViewModel: StoryViewModel(roomId: self.rooms.user?.currentRoomId ?? ""))
            case 3:
                ProfileView(showPrivacyPolicy:$showPrivacyPolicy)
            default:
                Text("") //TODO
            }
                EnigmaTabView(tabSelected: $tabSelected)
                    .blur(radius: rooms.presentPopup ? 3 : 0)
                    .ignoresSafeArea(.keyboard)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true) //both hiddens required
        .onAppear(perform: timerVM.getLeftTime)
        .onAppear(perform: rooms.fetchUser)
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
    @Published var showRoom: Bool = false
    @Published var showPrivacyPolicy: Bool = false
}
