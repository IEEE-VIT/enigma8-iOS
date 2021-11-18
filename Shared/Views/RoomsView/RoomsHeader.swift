//
//  RoomsHeader.swift
//  Enigma (iOS)
//
//  Created by Aaryan Kothari on 17/11/21.
//

import SwiftUI

struct RoomsHeader: View {
    @EnvironmentObject var roomsVM: RoomsViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                CustomLabel(text: "ROOMS",font: .Cinzel(size: 24, weight: .bold))
                Spacer()
                HStack {
                    Image("Key")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 22)
                    Text(": \(roomsVM.user?.stars ?? 0)")
                        .foregroundColor(.eBlue)
                        .font(.Mulish(size: 20, weight: .bold))
                }
            }
            HStack {
                CustomLabel(text:"New Room unlocks in \(roomsVM.starsRequired)",gradient: .blue)
                    .font(.Mulish(size: 16, weight: .semibold))
                Image("Key")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 11)
            }
        }
    }
}

struct RoomsHeader_Previews: PreviewProvider {
    static var previews: some View {
        RoomsHeader()
            .environmentObject(RoomsViewModel())
    }
}
