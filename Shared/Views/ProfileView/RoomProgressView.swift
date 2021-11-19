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
            RoomProgressTile(room:room,width: 40)
            RoomProgressViewTile(room: room, width: 40, isTop: true)
            RoomProgressViewTile(room: room, width: 40, isTop: true)
            RoomProgressViewTile(room: room, width: 40, isTop: true)
        }
            HStack{
                Spacer()
                ProgressLine(width: 40, color: .red, isSmooth: false,isVertical: <#T##Bool#>)
                    .rotationEffect(.degrees(90))
            }
            
            HStack(spacing: 0){
                RoomProgressViewTile(room: room, width: 40, isTop: false)
                RoomProgressViewTile(room: room, width: 40, isTop: false)
                RoomProgressViewTile(room: room, width: 40, isTop: false)
                RoomProgressTile(room:room,width: 40)
            }
    }
    }
}

struct RoomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressView()
    }
}
