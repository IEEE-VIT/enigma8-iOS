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
                ForEach(roomStory, id: \.self) { message in
                    HStack{
                        if message?.senderEnum == .sender1 || message?.senderEnum == .sender2 {
                        if message?.senderEnum == .sender2 {
                            Spacer()
                        }
                        StoryBubble(story: message ?? Story(roomNo: nil, sender: nil, message: nil), width: 360) //TODO
                        if message?.senderEnum == .sender1 {
                            Spacer()
                        }
                        } else {
                            
                        }
                    }
                }
        }
    }
}

struct RoomWiseStory_Previews: PreviewProvider {
    static var previews: some View {
        RoomWiseStory(roomStory: [Story(roomNo: nil, sender: nil, message: nil)])
    }
}
