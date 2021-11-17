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
    
    var body: some View {
        NavigationView {
               // NavigationLink(destination: PowerupView(powerupVM: GameViewModel(currentStatus: rooms.toRoom)), isActive: $rooms.navigateToRoom) {EmptyView() } // TODO
                VStack {
                    RoomsHeader()
                    ScrollView(showsIndicators: false) {
                    // MARK: GRID
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(rooms.allInfo, id: \.self) { room in
                            RoomTile(room: room)
                                .onTapGesture {
                                    if let roomUnlocked = room.journey?.roomUnlocked {
                                        if roomUnlocked == true {
                                            if(rooms.checkIfRoomSolved(room: room) == false) {
                                                rooms.roomUnlocked = true
                                                rooms.powerUpSelected = room.journey?.powerupId == nil ? false : true
                                                rooms.toRoom = room
                                                rooms.navigateToRoom = true
                                            } else {
                                                rooms.roomSolved = true
                                                rooms.presentRoomLocked = true
                                            }
                                        } else {
                                            rooms.checkIfRoomUnlocked(room: room)
                                        }
                                    } else {
                                        rooms.checkIfRoomUnlocked(room: room)
                                    }
                                }
                        }
                    }
                }
            }
                .padding(20)
            .popup(isPresented: $rooms.presentRoomLocked, animation: Animation.spring()) {
                EnigmaAlert(text: rooms.roomSolved ? "You have already solved this room!" : "You require \(rooms.starsNeeded) number of keys to unlock this", confirmAction: {rooms.presentRoomLocked.toggle()})
            }
            .fullScreenCover(isPresented: $rooms.navigateToRoom, content: {
                RoomUI(gameVM: GameViewModel(currentStatus: rooms.toRoom))
            })
            .onAppear {
                rooms.fetchAllInfo()
            }.navigationBarTitle("Enigma", displayMode: .automatic)
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)//both hiddens required
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView()
            .environmentObject(RoomsViewModel())
    }
}
