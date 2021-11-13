//
//  RoomTile.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/8/21.
//

import SwiftUI
import Kingfisher

struct RoomTile: View {
    var room: RoomsModel
    var body: some View {
        VStack {
            KFImage(URL(string: room.room?.media ?? ""))
                .resizable()
                .scaledToFit()
            Text(room.room?.title ?? "Room \(room.room?.roomNo ?? "0")")
        }
    }
}

struct RoomTile_Previews: PreviewProvider {
    static var previews: some View {
        RoomTile(room: RoomsModel(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: false, roomUnlocked: true, powerupId: "12345", questionsStatus: ["locked","solved","unlocked"]), room: Room(id: "1234", roomNo: "3", questionId: [], media: "", title: "", starQuota: 0)))
    }
}
