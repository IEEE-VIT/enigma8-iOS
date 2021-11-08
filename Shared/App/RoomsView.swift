//
//  RoomsView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 10/14/21.
//

import SwiftUI
import Kingfisher

struct RoomsView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @StateObject var rooms = RoomsViewModel()
    
    var body: some View {
        ScrollView {
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
                            //TODO: EMBED ROOMTILE IN NAVIGATION LINK
                            /*
                             NavigationLink isActive when rooms.roomUnlocked is true
                             Navigate to RoomUI when powerUpSelected is true
                             Navigate to PowerupView/Story view when powerUpSelected is false
                             */
                            RoomTile(room: room)
                                .onTapGesture {
                                    if let roomUnlocked = room.journey?.roomUnlocked {
                                        if roomUnlocked == true {
                                            rooms.roomUnlocked = true
                                            rooms.powerUpSelected = room.journey?.powerupId == nil ? false : true
                                        }
                                        else {
                                            rooms.checkIfRoomUnlocked(roomId: room.room?._id ?? "")
                                        }
                                    }
                                    else {
                                        rooms.checkIfRoomUnlocked(roomId: room.room?._id ?? "")
                                    }
                                }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            rooms.fetchAllInfo()
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView(rooms: RoomsViewModel())
    }
}
