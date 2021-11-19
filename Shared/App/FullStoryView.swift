//
//  FullStoryView.swift
//  Enigma (iOS)
//
//  Created by Ananya George on 11/8/21.
//

import SwiftUI

struct FullStoryView: View {
    @StateObject var storyViewModel: StoryViewModel
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if storyViewModel.fullStoryRoomwise.count > 0 {
                    ForEach(0..<storyViewModel.fullStoryRoomwise.count) { index in
                        RoomWiseStory(roomStory: storyViewModel.fullStoryRoomwise["\(index+1)"] ?? [])
                    }
                } else {
                    Spacer()
                    Text("Loading Stories!")
                    Spacer()
                }
            }
            .onAppear{
                storyViewModel.getFullStory()
            }.animation(.default)
        }
        .background(Image(ImageConstants.storyBG).resizable().frame(width: UIScreen.main.bounds.width))
    }
}

struct FullStoryView_Previews: PreviewProvider {
    static var previews: some View {
        FullStoryView(storyViewModel: StoryViewModel(roomId: ""))
    }
}
