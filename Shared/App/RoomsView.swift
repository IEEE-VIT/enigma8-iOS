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
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @EnvironmentObject var rooms : RoomsViewModel
    @EnvironmentObject var headerVM: HeaderRules
    
    var body: some View {
        ZStack {
            VStack {
                NavigationLink(destination: PowerupView(powerupVM: GameViewModel(currentStatus: rooms.toRoom)), isActive: $rooms.navigateToPowerups) { EmptyView() }
                
                NavigationLink(destination:  RoomUI().environmentObject(GameViewModel(currentStatus: rooms.toRoom)), isActive: $rooms.navigateToRoom) { EmptyView() }
                
                RoomsHeader().padding()
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(rooms.allInfo, id: \.self) { room in
                            RoomTile(room: room)
                                .onTapGesture {
                                    rooms.checkIfRoomUnlocked(room: room.room?._id)
                                }
                        }
                    }
                    .background( Image(ImageConstants.roomBG).resizable().scaledToFill())
                }
                .padding([.horizontal,.top],8)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            .padding([.horizontal,.top],8)
            .popup(isPresented: $rooms.presentPopup, animation: Animation.easeInOut) { rooms.alert }
            .onAppear(perform: rooms.fetchAllInfo)
            .onChange(of: rooms.navigateToRoom, perform: { newValue in
                self.headerVM.showRoom = newValue
            })
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
            .environmentObject(RoomsViewModel())
    }
}
