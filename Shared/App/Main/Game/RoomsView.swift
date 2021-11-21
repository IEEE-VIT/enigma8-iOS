//
//  RoomsView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI
import Kingfisher
import PopupView

struct RoomsView: View {
    @EnvironmentObject var rooms : RoomsViewModel
    @EnvironmentObject var headerVM: HeaderRules
    
    var body: some View {
        ZStack {
            VStack {
                NavigationLink(destination: PowerupView(powerupVM: GameViewModel(currentStatus: rooms.toRoom)), isActive: $rooms.navigateToPowerups) { EmptyView() }
                
                NavigationLink(destination:  RoomUI().environmentObject(GameViewModel(currentStatus: rooms.toRoom)), isActive: $rooms.navigateToRoom) { EmptyView() }
                
                RoomsHeader().padding()
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 0) {
                        ForEach(rooms.allInfo, id: \.self) { room in
                            RoomTile(room: room)
                                .onTapGesture {
                                    rooms.checkIfRoomUnlocked(room: room.room?._id)
                                }
                        }
                    }
                    .background( Image(ImageConstants.roomBG).resizable().scaledToFill())
                }
                .padding(.horizontal,UIScreen.main.bounds.width * 0.036)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .onAppear(perform: rooms.fetchAllInfo)
            .onAppear(perform: rooms.fetchUser)
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .blur(radius: rooms.presentPopup ? 3 : 0)
            if rooms.presentPopup {
                rooms.alert
            }
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
            .environmentObject(RoomsViewModel())
    }
}
