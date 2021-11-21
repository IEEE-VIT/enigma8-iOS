//
//  RoomProgressView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressView: View {
    @EnvironmentObject var roomsVM: RoomsViewModel
    @State var width: CGFloat
    var body: some View {
            if roomsVM.allInfo.count >= 8 {
                VStack(spacing:2) {
                    HStack(spacing: 0){
                        RoomProgressTile(room:roomsVM.allInfo[0],width: width * 0.125)
                        RoomProgressViewTile(room: roomsVM.allInfo[1], width: width * 0.125, isTop: true)
                        RoomProgressViewTile(room: roomsVM.allInfo[2], width: width * 0.125, isTop: true)
                        RoomProgressViewTile(room: roomsVM.allInfo[3], width: width * 0.125, isTop: true)
                    }
                    HStack{
                        Spacer()
                        VerticalProgressLine(width: width * 0.125, color: roomsVM.allInfo[4].journey?.roomStatus.color ?? .roomGrey, isSmooth: roomsVM.allInfo[4].journey?.isSmooth ?? false)
                    }
                    .padding(2)
                    
                    HStack(spacing: 0){
                        RoomProgressViewTile(room: roomsVM.allInfo[7], width: width * 0.125, isTop: false)
                        RoomProgressViewTile(room: roomsVM.allInfo[6], width: width * 0.125, isTop: false)
                        RoomProgressViewTile(room: roomsVM.allInfo[5], width: width * 0.125, isTop: false)
                        RoomProgressTile(room: roomsVM.allInfo[4],width: width * 0.125)
                    }
            }
                .frame(width: width, height: width * 0.62)
        }
    }
}

struct RoomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressView(width: 320)
    }
}
