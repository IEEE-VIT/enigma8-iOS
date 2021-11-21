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
            StoryHeaderStack()
                .padding()
            ScrollView(showsIndicators:false) {
                ScrollViewReader { sr in
                    ForEach(storyViewModel.fullStory) { message in
                        StoryBubble(story: message, width: UIScreen.main.bounds.width)
                            .id(message.id)
                    }.onAppear(perform: {sr.scrollTo(storyViewModel.fullStory.last?.id)})
                }
            }
            .onAppear(perform: storyViewModel.getFullStory)
        }
        .background(Image(ImageConstants.storyBG).resizable().frame(width: UIScreen.main.bounds.width))
    }
}

struct FullStoryView_Previews: PreviewProvider {
    static var previews: some View {
        FullStoryView(storyViewModel: StoryViewModel(roomId: ""))
    }
}
