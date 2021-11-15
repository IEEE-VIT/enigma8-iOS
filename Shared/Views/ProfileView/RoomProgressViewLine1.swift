//
//  RoomProgressViewLine.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressViewLine1: View {
    var body: some View {
        HStack {
            Spacer()
            RoomProgressLHS()
            RoomProgressMiddle()
            RoomProgressDownwards()
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct RoomProgressViewLine_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressViewLine1()
    }
}
