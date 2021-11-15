//
//  RoomProgressView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/15/21.
//

import SwiftUI

struct RoomProgressView: View {
    var body: some View {
        VStack(spacing: 0){
            RoomProgressViewLine1()
            RoomProgressViewLine2()
            
        }
    }
}

struct RoomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RoomProgressView()
    }
}
