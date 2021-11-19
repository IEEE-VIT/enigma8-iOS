//
//  RoomProgressView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressView: View {
    @EnvironmentObject var roomsVM: RoomsViewModel
    var body: some View {
        GeometryReader { gr in
            if roomsVM.allInfo.count > 8 {
                VStack {
                    HStack(spacing: 0){
                        RoomProgressTile(room:roomsVM.allInfo[0],width: gr.size.width * 0.125)
                        RoomProgressViewTile(room: roomsVM.allInfo[1], width: gr.size.width * 0.125, isTop: true)
                        RoomProgressViewTile(room: roomsVM.allInfo[2], width: gr.size.width * 0.125, isTop: true)
                        RoomProgressViewTile(room: roomsVM.allInfo[3], width: gr.size.width * 0.125, isTop: true)
                    }
                    HStack{
                        Spacer()
                        VerticalProgressLine(width: gr.size.width * 0.125, color: .red, isSmooth: false)
                    }
                    
                    HStack(spacing: 0){
                        RoomProgressViewTile(room: roomsVM.allInfo[7], width: gr.size.width * 0.125, isTop: false)
                        RoomProgressViewTile(room: roomsVM.allInfo[6], width: gr.size.width * 0.125, isTop: false)
                        RoomProgressViewTile(room: roomsVM.allInfo[5], width: gr.size.width * 0.125, isTop: false)
                        RoomProgressTile(room: roomsVM.allInfo[4],width: gr.size.width * 0.125)
                    }
                }
            }
        }
    }
}

struct RoomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressView()
    }
}
