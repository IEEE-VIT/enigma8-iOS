//
//  RoomWiseStory.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/8/21.
//

import SwiftUI

struct RoomWiseStory: View {
    @State var roomStory: [Story?]
    var body: some View {
        VStack {
            ScrollView {
                ForEach(roomStory, id: \.self) { message in
                    HStack {
                        if message?.senderEnum == .sender2 {
                            Spacer()
                        }
                        StoryBubble(story: message ?? Story(roomNo: nil, sender: nil, message: nil), width: 360) //TODO
                            .padding()
                        if message?.senderEnum == .sender1 {
                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct RoomWiseStory_Previews: PreviewProvider {
    static var previews: some View {
        RoomWiseStory(roomStory: [Story(roomNo: nil, sender: nil, message: nil)])
    }
}
