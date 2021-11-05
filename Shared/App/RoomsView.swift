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
                
                Spacer()
                // MARK: GRID
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(rooms.allInfo, id: \.self) { room in
                        VStack {
                            HStack {
                                ForEach(0..<3) { _ in
                                    Image(systemName: "circle")
                                }
                            }
                            KFImage(URL(string: room.room?.media ?? ""))
                                .resizable()
                                .scaledToFit()
                            Text(room.room?.title ?? "Room \(room.room?.roomNo ?? "0")")
                        }
                    }
//                    ForEach(rooms, id: \.self) { roomnum in
//                        VStack {
//                            Text("Room \(roomnum)")
//                            Image(systemName: "star")
//                                .resizable()
//                        }
//                    }
                }
            }
            .padding()
        }
    }
}

struct RoomsView_Previews: PreviewProvider {
    static var previews: some View {
        RoomsView(rooms: RoomsViewModel())
    }
}
