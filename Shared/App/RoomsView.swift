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
        VStack {
            NavigationLink(destination: PowerupView(powerupVM: GameViewModel(currentStatus: rooms.toRoom)), isActive: $rooms.navigateToPowerups) {EmptyView() } // TODO
            RoomsHeader()
            ScrollView(showsIndicators: false) {
                // MARK: GRID
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(rooms.allInfo, id: \.self) { room in
                        Button {
                            rooms.checkIfRoomUnlocked(room: room.room?._id)
                        } label: {
                            RoomTile(room: room)
                        }
                    }
                    .background(Image(ImageConstants.roomBG).resizable().scaledToFit().frame(width: UIScreen.main.bounds.width, alignment: .top))
                }
            }
            .padding([.horizontal,.top],8)
            
            .popup(isPresented: $rooms.presentRoomLocked, animation: Animation.spring()) {
                EnigmaAlert(text: rooms.roomSolved ? "You have already solved this room!" : "You require \(rooms.starsNeeded) number of keys to unlock this", confirmAction: {rooms.presentRoomLocked.toggle()})
            }
            .fullScreenCover(isPresented: $rooms.navigateToRoom, content: {
                RoomUI().environmentObject(GameViewModel(currentStatus: rooms.toRoom))
            })
            .onAppear {
                rooms.fetchAllInfo()
            }
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
