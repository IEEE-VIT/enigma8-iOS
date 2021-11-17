//
//  RoomTile.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/8/21.
//

import SwiftUI
import Kingfisher

struct RoomTile: View {
    var room: RoomsModel
    var body: some View {
        GeometryReader { gr in
            VStack(spacing:5) {
                TorchBar(journey: room.journey ?? Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["locked","solved","unlocked"]), width: gr.size.width) //TODO REMVE DEFAULT
                KFImage(URL(string: room.room?.media ?? ""))
                    .resizable()
                    .scaledToFit()
                Text(room.room?.title ?? "Room \(room.room?.roomNo ?? "0")")
                    .font(.Mulish(size: 12, weight: .regular))
                    .foregroundColor(.eGold)
            }
        }
        .aspectRatio(0.5, contentMode: .fit)
        .padding(.vertical,10)
        .padding(.horizontal,30)
    }
}

struct TorchBar: View {
    var journey: Journey
    var width: CGFloat
    var body: some View {
        HStack(spacing: width * 0.17) {
            Image(journey.questionsStatus?[0].rawValue ?? "locked")
                .resizable()
                .scaledToFit()
                .offset(y:width * 0.05)
            Image(journey.questionsStatus?[1].rawValue ?? "locked")
                .resizable()
                .scaledToFit()
                .offset(y:-width * 0.05)
            Image(journey.questionsStatus?[2].rawValue ?? "locked")
                .resizable()
                .scaledToFit()
                .offset(y:width * 0.05)
        }
        .padding(width * 0.07)
    }
}

struct RoomTile_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RoomTile(room: RoomsModel(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["locked","solved","unlocked"]), room: Room(id: "1234", roomNo: "3", questionId: [], media: "https://firebasestorage.googleapis.com/v0/b/enigma-8.appspot.com/o/Room%2FRoom%207.png?alt=media&token=adc9c32c-18e8-4d28-bd26-30dd00192d39", title: "Room 1", starQuota: 0)))
                .previewLayout(.sizeThatFits)
            
            TorchBar(journey: Journey(id: nil, userId: nil, roomId: "1234", stars: 0, powerupUsed: .no, roomUnlocked: true, powerupId: "12345", questionsStatus: ["locked","solved","unlocked"]), width: 115)
                .frame(width: 115)
                .previewLayout(.sizeThatFits)
        }
    }
}
