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
    @StateObject var rooms = RoomsViewModel()
    
    var body: some View {
        NavigationView {
        ScrollView {
            NavigationLink(destination: rooms.powerUpSelected ?
                           AnyView(RoomUI(gameVM: GameViewModel(currentStatus: rooms.toRoom ?? RoomsModel()))) : AnyView(PowerupView(powerupVM: GameViewModel(currentStatus: rooms.toRoom ?? RoomsModel()))),
                           isActive: $rooms.navigateToRoom) {EmptyView()}
            VStack {
                // MARK: TITLE
                HStack {
                    Text("Rooms")
                        .font(.title)
                    Spacer()
                }
                // MARK: GRID
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(rooms.allInfo, id: \.self) { room in
                        VStack {
                            RoomQuestionStatusView(questionStatus: room.journey?.questionsStatus ?? [.null, .null, .null])
                            RoomTile(room: room)
                                .onTapGesture {
                                    print("Room Clicked \(room.journey?.roomUnlocked ?? true)")
                                    if let roomUnlocked = room.journey?.roomUnlocked {
                                        if roomUnlocked == true {
                                            print("something")
                                            rooms.roomUnlocked = true
                                            rooms.powerUpSelected = room.journey?.powerupId == nil ? false : true
                                            rooms.toRoom = room
                                            rooms.navigateToRoom = true
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
            .padding()
        }
        .popup(isPresented: $rooms.presentNumberOfStars, animation: Animation.spring()) {
            EnigmaAlert(text: "You require \(rooms.starsNeeded) number of keys to unlock this", confirmAction: {rooms.presentNumberOfStars.toggle()})
        }
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
        RoomsView(rooms: RoomsViewModel())
    }
}
