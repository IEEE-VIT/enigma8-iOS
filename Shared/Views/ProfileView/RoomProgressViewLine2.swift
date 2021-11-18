//
//  RoomProgressViewLine2.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressViewLine2: View {
    var body: some View {
        HStack {
            Spacer()
            RoomProgressLHS()
            RoomProgressMiddle()
            RoomProgressUpwards()
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct RoomProgressViewLine2_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressViewLine2()
    }
}
