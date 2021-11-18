//
//  RoomProgressView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressView: View {
    var room = RoomsModel(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["locked","solved","unlocked"]), room: Room(id: "1234", roomNo: "3", questionId: [], media: "https://firebasestorage.googleapis.com/v0/b/enigma-8.appspot.com/o/Room%2FRoom%207.png?alt=media&token=adc9c32c-18e8-4d28-bd26-30dd00192d39", title: "Room 3", starQuota: 0))
    var body: some View {
        VStack(spacing: 0){
            RoomProgressTile(room: room, width: 40)
        }
    }
}

struct RoomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressView()
    }
}
