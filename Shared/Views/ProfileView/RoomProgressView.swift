//
//  RoomProgressView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressView: View {
    var room = RoomsModel.data //TODO rm data
    var body: some View {
        VStack {
        HStack(spacing: 0){
            RoomProgressViewTile(room: room, width: 40, isTop: true)
            RoomProgressViewTile(room: room, width: 40, isTop: true)
            RoomProgressViewTile(room: room, width: 40, isTop: true)
        }
            HStack(spacing: 0){
                RoomProgressViewTile(room: room, width: 40, isTop: false)
                RoomProgressViewTile(room: room, width: 40, isTop: false)
                RoomProgressViewTile(room: room, width: 40, isTop: false)
            }
    }
    }
}

struct RoomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressView()
    }
}
