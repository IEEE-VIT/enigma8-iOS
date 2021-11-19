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
        VStack(spacing: 0) {
           StoryHeader()
                .padding()
            ScrollView {
                ScrollViewReader { sr in
                        if storyViewModel.fullStoryRoomwise.count > 0 {
                            ForEach(storyViewModel.fullStoryRoomwise) { story in
                                RoomWiseStory(roomStory: storyViewModel.fullStoryRoomwise["\(index+1)"] ?? []).id(story.id)
                            }
                        } else {
                            Spacer()
                            Text("Loading Stories!")
                            Spacer()
                        }
                    }
                }
                .onAppear{
                    storyViewModel.getFullStory()
                }
        }
            .background(Image(ImageConstants.storyBG).resizable().frame(width: UIScreen.main.bounds.width))
    }
}

struct FullStoryView_Previews: PreviewProvider {
    static var previews: some View {
        FullStoryView(storyViewModel: StoryViewModel(roomId: ""))
    }
}
