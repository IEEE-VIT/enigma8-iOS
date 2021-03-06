//
//  RoomStates.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/18/21.
//

import SwiftUI

struct RoomStates: View {
    var data: [String] = AppConstants.instructionsRoomStates
    var body: some View {
        ScrollView(showsIndicators:false) {
            VStack(alignment: .leading) {
                ForEach(data, id: \.self) { point in
                    HStack(alignment: .top) {
                        Image("BulletPoint")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 8)
                            .padding(.top, 5)
                        Text(point)
                            .font(.Mulish(size: 18, weight: .medium))
                            .foregroundColor(Color.eGold)
                    }
                    .padding(.top)
                }
            }
            Spacer()
            HStack {
                Image("RoomInstructionFlames")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 173)
                    .padding()
                VStack(alignment: .leading){
                    ForEach(AppConstants.instructionsRoomStatus, id: \.self) { state in
                        RoomStatesTorches(name: state)
                    }
                }
                .padding()
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct RoomStates_Previews: PreviewProvider {
    static var previews: some View {
        RoomStates()
    }
}
